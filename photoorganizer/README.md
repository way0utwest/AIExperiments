# Photo Organizer

A Python script that automatically organizes photos into year/month folder structures based on EXIF data and filenames.

## Features

- ✅ Reads EXIF metadata to get accurate photo dates
- ✅ Falls back to filename parsing if EXIF data is unavailable
- ✅ Organizes photos into `YYYY/MM/` folder structure
- ✅ Supports dry-run mode to preview changes
- ✅ Can copy or move files
- ✅ Handles duplicate filenames automatically
- ✅ Supports common image formats (JPG, PNG, HEIC, RAW, etc.)

## Installation

1. Install Python 3.6 or higher
2. Install dependencies:
```bash
pip install -r requirements.txt
```

## Usage

### Basic Usage

**Dry run (preview only - recommended first step):**
```bash
python photo_organizer.py /path/to/photos /path/to/organized --dry-run
```

**Move photos (default):**
```bash
python photo_organizer.py /path/to/photos /path/to/organized
```

**Copy photos (keep originals):**
```bash
python photo_organizer.py /path/to/photos /path/to/organized --copy
```

### Arguments

- `source` - Source directory containing your photos
- `destination` - Destination directory where organized photos will be placed
- `--copy` - Copy files instead of moving them
- `--dry-run` - Preview what would happen without making changes

## How It Works

1. **EXIF Data Priority**: The script first tries to read the photo's EXIF data to find when the photo was actually taken
2. **Filename Fallback**: If EXIF data is unavailable, it tries to parse the date from the filename
3. **Folder Creation**: Creates folders in the format `YYYY/MM/` (e.g., `2026/01/` for January 2026)
4. **File Moving/Copying**: Moves or copies photos to the appropriate folder
5. **Conflict Resolution**: If a file with the same name exists, it adds a number suffix

## Example Output Structure

```
organized_photos/
├── 2024/
│   ├── 01/
│   │   ├── IMG_20240115.jpg
│   │   └── vacation_photo.jpg
│   ├── 02/
│   │   └── IMG_20240220.jpg
│   └── 12/
│       └── holiday_pic.jpg
└── 2026/
    └── 01/
        ├── IMG_20260130.jpg
        └── recent_photo.jpg
```

## Supported File Formats

- JPEG (.jpg, .jpeg)
- PNG (.png)
- GIF (.gif)
- BMP (.bmp)
- TIFF (.tiff, .tif)
- HEIC/HEIF (.heic, .heif)
- RAW formats (.raw, .cr2, .nef, .arw, .dng)

## Tips

1. **Always do a dry run first** to see what will happen
2. **Use --copy mode** if you want to keep the originals untouched
3. The script looks for dates in EXIF tags: DateTimeOriginal, DateTime, and DateTimeDigitized
4. Files without dates (no EXIF and no date in filename) will be skipped and listed in the summary

## Troubleshooting

**Files are skipped:**
- Check if the file has EXIF data (many screenshots and downloaded images don't)
- Check if the filename contains a date in formats like YYYYMMDD or YYYY-MM-DD

**EXIF reading errors:**
- Some RAW formats may not be fully supported by Pillow
- Corrupted files may cause EXIF reading to fail

**Permission errors:**
- Make sure you have read/write permissions for both source and destination folders
