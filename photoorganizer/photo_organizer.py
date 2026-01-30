#!/usr/bin/env python3
"""
Photo Organizer - Sorts photos into year/month folder structure
Uses EXIF data to determine photo dates
"""

import os
import shutil
from datetime import datetime
from pathlib import Path
import argparse
from PIL import Image
from PIL.ExifTags import TAGS
import re

# Register HEIC opener
try:
    from pillow_heif import register_heif_opener
    register_heif_opener()
    HEIC_SUPPORTED = True
except ImportError:
    HEIC_SUPPORTED = False
    print("Warning: pillow-heif not installed. HEIC files may not be readable.")
    print("Install with: pip install pillow-heif")


def get_date_from_exif(image_path):
    """Extract date from EXIF data."""
    try:
        image = Image.open(image_path)
        exif_data = image._getexif()
        
        if exif_data is None:
            return None
        
        # Look for DateTimeOriginal (when photo was taken)
        for tag_id, value in exif_data.items():
            tag_name = TAGS.get(tag_id, tag_id)
            if tag_name in ['DateTimeOriginal', 'DateTime', 'DateTimeDigitized']:
                # EXIF datetime format: "2024:01:15 14:30:45"
                try:
                    dt = datetime.strptime(value, "%Y:%m:%d %H:%M:%S")
                    return dt
                except ValueError:
                    continue
        
        return None
    except Exception as e:
        print(f"  Warning: Could not read EXIF from {os.path.basename(image_path)}: {e}")
        return None


def convert_heic_to_jpg(heic_path, jpg_path):
    """Convert HEIC file to JPG format."""
    try:
        if not HEIC_SUPPORTED:
            print(f"  ⚠ Cannot convert HEIC - pillow-heif not installed")
            return False
            
        image = Image.open(heic_path)
        
        # Convert to RGB if necessary (HEIC can have different color modes)
        if image.mode not in ('RGB', 'L'):
            image = image.convert('RGB')
        
        # Save as JPEG with high quality
        image.save(jpg_path, 'JPEG', quality=95, exif=image.info.get('exif', b''))
        print(f"  ✓ Converted HEIC to JPG")
        return True
    except Exception as e:
        print(f"  ✗ Error converting HEIC: {e}")
        return False


def get_date_from_filename(filename):
    """Try to extract date from filename using common patterns."""
    # Common patterns: IMG_20240115, 2024-01-15, 20240115, etc.
    patterns = [
        r'(\d{4})[-_]?(\d{2})[-_]?(\d{2})',  # YYYY-MM-DD or YYYYMMDD
        r'(\d{4})(\d{2})(\d{2})',             # YYYYMMDD
    ]
    
    for pattern in patterns:
        match = re.search(pattern, filename)
        if match:
            try:
                year, month, day = match.groups()
                dt = datetime(int(year), int(month), int(day))
                return dt
            except ValueError:
                continue
    
    return None


def get_photo_date(image_path):
    """Get photo date, preferring EXIF data over filename."""
    # Try EXIF first
    date = get_date_from_exif(image_path)
    if date:
        return date, "EXIF"
    
    # Fall back to filename
    filename = os.path.basename(image_path)
    date = get_date_from_filename(filename)
    if date:
        return date, "filename"
    
    return None, None


def organize_photos(source_dir, dest_dir, copy_mode=False, dry_run=False, convert_heic=False):
    """
    Organize photos into year/month folder structure.
    
    Args:
        source_dir: Source directory containing photos
        dest_dir: Destination directory for organized photos
        copy_mode: If True, copy files instead of moving them
        dry_run: If True, only show what would be done without actually doing it
        convert_heic: If True, convert HEIC files to JPG during organization
    """
    source_path = Path(source_dir).resolve()
    dest_path = Path(dest_dir).resolve()
    
    # Common image extensions
    image_extensions = {'.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.tif', 
                       '.heic', '.heif', '.raw', '.cr2', '.nef', '.arw', '.dng'}
    
    # Find all image files
    image_files = []
    for ext in image_extensions:
        image_files.extend(source_path.rglob(f'*{ext}'))
        image_files.extend(source_path.rglob(f'*{ext.upper()}'))
    
    print(f"Found {len(image_files)} image files to process\n")
    
    stats = {
        'processed': 0,
        'skipped': 0,
        'exif_used': 0,
        'filename_used': 0,
        'no_date': 0,
        'heic_converted': 0
    }
    
    no_date_files = []
    
    for img_path in sorted(image_files):
        filename = img_path.name
        print(f"Processing: {filename}")
        
        # Get photo date
        photo_date, source_type = get_photo_date(str(img_path))
        
        if photo_date is None:
            print(f"  ⚠ No date found - skipping")
            stats['skipped'] += 1
            stats['no_date'] += 1
            no_date_files.append(filename)
            print()
            continue
        
        # Track source of date
        if source_type == "EXIF":
            stats['exif_used'] += 1
        elif source_type == "filename":
            stats['filename_used'] += 1
        
        # Create destination path: YYYY/MM/filename
        year = photo_date.strftime("%Y")
        month = photo_date.strftime("%m")
        
        dest_folder = dest_path / year / month
        
        # Check if we should convert HEIC to JPG
        is_heic = img_path.suffix.lower() in ['.heic', '.heif']
        if is_heic and convert_heic:
            # Change extension to .jpg
            base_name = img_path.stem
            dest_filename = f"{base_name}.jpg"
            dest_file = dest_folder / dest_filename
        else:
            dest_file = dest_folder / filename
        
        print(f"  Date: {photo_date.strftime('%Y-%m-%d')} (from {source_type})")
        print(f"  Destination: {year}/{month}/{dest_file.name}")
        
        if not dry_run:
            # Create destination folder if it doesn't exist
            dest_folder.mkdir(parents=True, exist_ok=True)
            
            # Handle file conflicts
            if dest_file.exists():
                base, ext = os.path.splitext(dest_file.name)
                counter = 1
                while dest_file.exists():
                    new_filename = f"{base}_{counter}{ext}"
                    dest_file = dest_folder / new_filename
                    counter += 1
                print(f"  ⚠ File exists, renaming to: {dest_file.name}")
            
            # Copy or move the file
            try:
                if is_heic and convert_heic:
                    # Convert HEIC to JPG
                    if convert_heic_to_jpg(str(img_path), str(dest_file)):
                        stats['heic_converted'] += 1
                        if not copy_mode:
                            # Remove original HEIC file after successful conversion
                            os.remove(str(img_path))
                        print(f"  ✓ Converted and {'copied' if copy_mode else 'moved'}")
                        stats['processed'] += 1
                    else:
                        print(f"  ✗ Conversion failed")
                        stats['skipped'] += 1
                else:
                    # Regular copy or move
                    if copy_mode:
                        shutil.copy2(str(img_path), str(dest_file))
                        print(f"  ✓ Copied")
                    else:
                        shutil.move(str(img_path), str(dest_file))
                        print(f"  ✓ Moved")
                    stats['processed'] += 1
            except Exception as e:
                print(f"  ✗ Error: {e}")
                stats['skipped'] += 1
        else:
            print(f"  [DRY RUN - no action taken]")
            stats['processed'] += 1
        
        print()
    
    # Print summary
    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"Total files found: {len(image_files)}")
    print(f"Successfully processed: {stats['processed']}")
    print(f"Skipped: {stats['skipped']}")
    print(f"  - Date from EXIF: {stats['exif_used']}")
    print(f"  - Date from filename: {stats['filename_used']}")
    print(f"  - No date found: {stats['no_date']}")
    if convert_heic:
        print(f"  - HEIC files converted to JPG: {stats['heic_converted']}")
    
    if no_date_files:
        print(f"\nFiles without dates:")
        for f in no_date_files[:10]:  # Show first 10
            print(f"  - {f}")
        if len(no_date_files) > 10:
            print(f"  ... and {len(no_date_files) - 10} more")
    
    if dry_run:
        print("\n[DRY RUN MODE - No files were actually moved/copied]")


def main():
    parser = argparse.ArgumentParser(
        description='Organize photos into year/month folder structure using EXIF data',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Dry run to see what would happen
  python photo_organizer.py /path/to/photos /path/to/organized --dry-run
  
  # Move photos (default)
  python photo_organizer.py /path/to/photos /path/to/organized
  
  # Copy photos instead of moving
  python photo_organizer.py /path/to/photos /path/to/organized --copy
  
  # Convert HEIC files to JPG during organization
  python photo_organizer.py /path/to/photos /path/to/organized --convert-heic
        """
    )
    
    parser.add_argument('source', help='Source directory containing photos')
    parser.add_argument('destination', help='Destination directory for organized photos')
    parser.add_argument('--copy', action='store_true', 
                       help='Copy files instead of moving them')
    parser.add_argument('--convert-heic', action='store_true',
                       help='Convert HEIC files to JPG format during organization')
    parser.add_argument('--dry-run', action='store_true',
                       help='Show what would be done without actually doing it')
    
    args = parser.parse_args()
    
    # Validate source directory
    if not os.path.isdir(args.source):
        print(f"Error: Source directory '{args.source}' does not exist")
        return 1
    
    # Create destination directory if it doesn't exist
    if not args.dry_run:
        os.makedirs(args.destination, exist_ok=True)
    
    print("Photo Organizer")
    print("=" * 60)
    print(f"Source: {args.source}")
    print(f"Destination: {args.destination}")
    print(f"Mode: {'COPY' if args.copy else 'MOVE'}")
    if args.convert_heic:
        print("Convert HEIC: YES")
    if args.dry_run:
        print("DRY RUN: No files will be modified")
    print("=" * 60)
    print()
    
    organize_photos(args.source, args.destination, args.copy, args.dry_run, args.convert_heic)
    
    return 0


if __name__ == '__main__':
    exit(main())
