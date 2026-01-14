#!/usr/bin/env python3
"""
Log Activity Analyzer

This script analyzes log files in the Anonymization and Subsetter subdirectories
and produces a summary of activities by month and year.
"""

import os
import re
import json
import csv
from collections import defaultdict
from datetime import datetime
from pathlib import Path


def parse_anonymization_log(file_path):
    """
    Parse anonymization log files for classify, map, and mask activities.
    Returns a list of (timestamp, activity_type) tuples.
    """
    activities = []

    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue

                # Try to parse as JSON (structured logs)
                try:
                    log_entry = json.loads(line)
                    task = log_entry.get('task')
                    timestamp_str = log_entry.get('@t')

                    if task and timestamp_str:
                        # Parse ISO 8601 timestamp
                        timestamp = datetime.fromisoformat(timestamp_str.replace('Z', '+00:00'))

                        # Only count the start of each activity
                        message = log_entry.get('@mt', '')
                        if task == 'classify' and 'Classifying database' in message:
                            activities.append((timestamp, 'classify'))
                        elif task == 'map' and 'Creating masking file' in message:
                            activities.append((timestamp, 'map'))
                        elif task == 'mask' and 'Masking database' in message:
                            activities.append((timestamp, 'mask'))

                except (json.JSONDecodeError, ValueError):
                    # Try to parse as readable log format
                    # Format: 2024-12-20 13:47:38.998 -07:00 [INF] Classifying database BB_Subset...
                    if '[INF]' in line and 'Classifying database' in line:
                        match = re.match(r'^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})', line)
                        if match:
                            timestamp_str = match.group(1)
                            timestamp = datetime.strptime(timestamp_str, '%Y-%m-%d %H:%M:%S')
                            activities.append((timestamp, 'classify'))

    except Exception as e:
        print(f"Warning: Could not parse {file_path}: {e}")

    return activities


def parse_subsetter_log(file_path):
    """
    Parse subsetter log files for "Subsetter started" activities.
    Returns a list of (timestamp, activity_type) tuples.
    """
    activities = []

    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue

                # Look for "Subsetter started" in readable logs
                if '[INF]' in line and 'Subsetter started' in line:
                    # Format: 2024-12-20 12:39:44.024 -07:00 [INF] Subsetter started
                    match = re.match(r'^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})', line)
                    if match:
                        timestamp_str = match.group(1)
                        timestamp = datetime.strptime(timestamp_str, '%Y-%m-%d %H:%M:%S')
                        activities.append((timestamp, 'subsetter'))

    except Exception as e:
        print(f"Warning: Could not parse {file_path}: {e}")

    return activities


def analyze_logs(base_path='.'):
    """
    Analyze all log files in the Anonymization and Subsetter subdirectories.
    Returns a dictionary of activities grouped by year and month.
    """
    base_path = Path(base_path)

    # Dictionary structure: {(year, month): {activity_type: count}}
    monthly_summary = defaultdict(lambda: defaultdict(int))

    # Process Anonymization logs
    anon_path = base_path / 'Anonymization'
    if anon_path.exists():
        print(f"Scanning {anon_path}...")
        for log_file in anon_path.glob('*.log'):
            activities = parse_anonymization_log(log_file)
            for timestamp, activity_type in activities:
                year_month = (timestamp.year, timestamp.month)
                monthly_summary[year_month][activity_type] += 1

    # Process Subsetter logs
    subset_path = base_path / 'Subsetter'
    if subset_path.exists():
        print(f"Scanning {subset_path}...")
        for log_file in subset_path.glob('*.log'):
            activities = parse_subsetter_log(log_file)
            for timestamp, activity_type in activities:
                year_month = (timestamp.year, timestamp.month)
                monthly_summary[year_month][activity_type] += 1

    return monthly_summary


def print_summary(monthly_summary):
    """
    Print a formatted summary of activities by month and year.
    """
    if not monthly_summary:
        print("No activities found in log files.")
        return

    # Sort by year and month
    sorted_months = sorted(monthly_summary.keys())

    print("\n" + "="*80)
    print("LOG ACTIVITY SUMMARY BY MONTH")
    print("="*80)
    print()

    # Print header
    print(f"{'Year-Month':<15} {'Classify':<12} {'Map':<12} {'Mask':<12} {'Subsetter':<12} {'Total':<12}")
    print("-" * 80)

    # Track totals
    totals = defaultdict(int)

    # Print each month
    for year, month in sorted_months:
        month_name = datetime(year, month, 1).strftime('%Y-%m')
        activities = monthly_summary[(year, month)]

        classify_count = activities['classify']
        map_count = activities['map']
        mask_count = activities['mask']
        subsetter_count = activities['subsetter']
        total = classify_count + map_count + mask_count + subsetter_count

        print(f"{month_name:<15} {classify_count:<12} {map_count:<12} {mask_count:<12} {subsetter_count:<12} {total:<12}")

        # Update totals
        totals['classify'] += classify_count
        totals['map'] += map_count
        totals['mask'] += mask_count
        totals['subsetter'] += subsetter_count
        totals['total'] += total

    # Print totals
    print("-" * 80)
    print(f"{'TOTAL':<15} {totals['classify']:<12} {totals['map']:<12} {totals['mask']:<12} {totals['subsetter']:<12} {totals['total']:<12}")
    print("="*80)
    print()

    # Print yearly summary
    print("\nYEARLY SUMMARY")
    print("-" * 80)

    yearly_summary = defaultdict(lambda: defaultdict(int))
    for (year, month), activities in monthly_summary.items():
        for activity_type, count in activities.items():
            yearly_summary[year][activity_type] += count

    print(f"{'Year':<15} {'Classify':<12} {'Map':<12} {'Mask':<12} {'Subsetter':<12} {'Total':<12}")
    print("-" * 80)

    for year in sorted(yearly_summary.keys()):
        activities = yearly_summary[year]
        classify_count = activities['classify']
        map_count = activities['map']
        mask_count = activities['mask']
        subsetter_count = activities['subsetter']
        total = classify_count + map_count + mask_count + subsetter_count

        print(f"{year:<15} {classify_count:<12} {map_count:<12} {mask_count:<12} {subsetter_count:<12} {total:<12}")

    print("="*80)
    print()


def export_to_csv(monthly_summary, base_path='.'):
    """
    Export the summary data to CSV files.
    """
    base_path = Path(base_path)

    # Export monthly summary
    monthly_csv = base_path / 'log_activity_monthly.csv'
    print(f"Exporting monthly summary to {monthly_csv}...")

    with open(monthly_csv, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)

        # Write header
        writer.writerow(['Year', 'Month', 'Year-Month', 'Classify', 'Map', 'Mask', 'Subsetter', 'Total'])

        # Sort by year and month
        sorted_months = sorted(monthly_summary.keys())

        # Write data rows
        for year, month in sorted_months:
            month_name = datetime(year, month, 1).strftime('%Y-%m')
            activities = monthly_summary[(year, month)]

            classify_count = activities['classify']
            map_count = activities['map']
            mask_count = activities['mask']
            subsetter_count = activities['subsetter']
            total = classify_count + map_count + mask_count + subsetter_count

            writer.writerow([year, month, month_name, classify_count, map_count, mask_count, subsetter_count, total])

        # Write totals row
        totals = defaultdict(int)
        for activities in monthly_summary.values():
            for activity_type, count in activities.items():
                totals[activity_type] += count

        total_all = totals['classify'] + totals['map'] + totals['mask'] + totals['subsetter']
        writer.writerow(['', '', 'TOTAL', totals['classify'], totals['map'], totals['mask'], totals['subsetter'], total_all])

    print(f"Monthly summary exported to {monthly_csv}")

    # Export yearly summary
    yearly_csv = base_path / 'log_activity_yearly.csv'
    print(f"Exporting yearly summary to {yearly_csv}...")

    yearly_summary = defaultdict(lambda: defaultdict(int))
    for (year, month), activities in monthly_summary.items():
        for activity_type, count in activities.items():
            yearly_summary[year][activity_type] += count

    with open(yearly_csv, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)

        # Write header
        writer.writerow(['Year', 'Classify', 'Map', 'Mask', 'Subsetter', 'Total'])

        # Write data rows
        for year in sorted(yearly_summary.keys()):
            activities = yearly_summary[year]
            classify_count = activities['classify']
            map_count = activities['map']
            mask_count = activities['mask']
            subsetter_count = activities['subsetter']
            total = classify_count + map_count + mask_count + subsetter_count

            writer.writerow([year, classify_count, map_count, mask_count, subsetter_count, total])

        # Write totals row
        totals = defaultdict(int)
        for activities in yearly_summary.values():
            for activity_type, count in activities.items():
                totals[activity_type] += count

        total_all = totals['classify'] + totals['map'] + totals['mask'] + totals['subsetter']
        writer.writerow(['TOTAL', totals['classify'], totals['map'], totals['mask'], totals['subsetter'], total_all])

    print(f"Yearly summary exported to {yearly_csv}")
    print()


def main():
    """Main entry point."""
    print("Starting log analysis...")
    print()

    # Get the directory where the script is located
    script_dir = Path(__file__).parent

    # Analyze logs
    monthly_summary = analyze_logs(script_dir)

    # Print summary
    print_summary(monthly_summary)

    # Export to CSV
    export_to_csv(monthly_summary, script_dir)

    print("Analysis complete!")


if __name__ == '__main__':
    main()
