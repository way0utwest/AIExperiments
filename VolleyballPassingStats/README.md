# Volleyball Stats Tracker - Development Summary

## Project Overview
A web-based volleyball statistics tracking application optimized for iPad use. The app allows coaches or players to track passing performance for up to 12 players in a clean, touch-friendly interface. There are two versions of these files: `volleyball-stats_13Black.html` and `volleball-pass-tracker.html`, both providing similar functionality.

### volleyball-stats_13Black.html
This version is a 3x4 grid that allows tracking for 12 players. Each player has customizable names, and users can rate each pass with a score from 0 to 3. The app calculates and displays the average pass score in real-time. There is an undo button below the rating buttions for correcting mistakes. Users can export the data as a JSON file or reset all statistics while preserving player names.

### volleball-pass-tracker.html
This is a 25 pass tracker that has 1-25 down the left side with 4 buttons for rating serve receive passes. The top of each line can be customized if needed. This calculates a basic average of all passes rated.

If you make a mistake rating a pass, just click the correct rating button to adjust the rating.

## What Was Built
A single-page HTML web application that works in any modern browser, with special optimization for iPad tablets.

## Key Features

### Player Management
- 4x3 grid layout displaying 12 player cards
- Customizable player names that persist across sessions
- Names automatically save when changed

### Stats Tracking
- Four rating buttons (0, 1, 2, 3) for each player to rate pass quality
- Real-time calculation of average pass score (sum of ratings ÷ attempts)
- Display of attempts, total score, and average for each player
- Color-coded rating buttons (red=0, orange=1, green=2, teal=3)

### Session Information
- Date field (defaults to current date)
- Goal field for session objectives
- Time field (defaults to current time)

### Data Management
- **Export JSON**: Exports all data to a downloadable text file with timestamp as a JSON file. There is a summary at the top.
- **Export CSV**: exports a CSV file of the current stats.
- **Reset Stats**: Clears all statistics while preserving player names
- Automatic data persistence using browser local storage
- All data survives page refreshes and browser closures

### User Experience
- Responsive design that adapts to different screen sizes
- Touch-optimized buttons for iPad use
- Visual feedback with color-coded ratings
- Toast notifications for user actions
- Can be added to iPad home screen as a standalone app

## Technical Details

### Technology Stack
- Pure HTML, CSS, and JavaScript (no dependencies)
- Browser localStorage for data persistence
- Responsive CSS Grid layout
- Modern ES6+ JavaScript

### File Structure
- Single HTML file containing all code
- Self-contained with inline CSS and JavaScript
- No external dependencies or internet connection required after initial load

## How to Use on iPad

1. Open the `volleyball-stats_13Black.html` or `volleball-pass-tracker.html` file in Microsoft Edge
2. Tap the Share button (square with arrow)
3. Select "Add to Home Screen"
4. The app will appear as an icon on your home screen
5. Launch like any native app

## Development Journey

### Initial Request
Build an iPad app for tracking volleyball stats with a 4x3 player grid, customizable names, pass ratings (0-3), and real-time averages.

### Iterations Made
1. **Initial build**: Created full-featured app with 12 player cards, rating system, and export functionality
2. **Bug fix**: Fixed "Clear All Data" button not properly updating the display
3. **Feature adjustment**: Changed "Clear All Data" to only clear statistics while preserving player names
4. **UI simplification**: Removed redundant button, streamlined to two main actions

### Key Decisions
- Used web app instead of native iOS app for immediate usability and cross-platform compatibility
- Implemented localStorage for data persistence without requiring a backend
- Color-coded rating buttons for quick visual feedback
- Separated session info (date/goal/time) from persistent player data

## Future Enhancement Ideas
- Export to CSV format for spreadsheet analysis
- Chart/graph visualization of player performance over time
- Team statistics and comparisons
- Multiple session history tracking
- Cloud sync across devices
- Print-friendly reports

## Files Delivered
- `volleyball-stats.html` - Complete working application
- `README.md` - This documentation file

## Notes
- All player names and statistics are stored locally in the browser
- Data will persist as long as browser data isn't cleared
- No internet connection required after initial load
- Works offline once loaded
