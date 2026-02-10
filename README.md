# iOS Notification App - Quick Start

## Created Files

✅ **NotificationApp.swift** - Main app entry point
✅ **ContentView.swift** - User interface (5 lines of setup needed)
✅ **NotificationManager.swift** - Notification scheduling logic
✅ **SETUP_AND_TESTING_GUIDE.md** - Detailed instructions

## What This App Does

- Sends local notifications every **5 seconds** (configurable to 5 minutes)
- Shows a counter of notifications sent
- Only works while the app is open in foreground
- Simple Start/Stop button interface

## Quick Setup on Mac (3 Steps)

### 1. Create Xcode Project
   - Open Xcode
   - File → New → Project → iOS App → SwiftUI
   - Name it "NotificationApp"

### 2. Add Swift Files
   - Copy the 3 `.swift` files into your project folder
   - In Xcode: File → Add Files To...
   - Select the 3 Swift files

### 3. Run on iPhone 14 Simulator
   - Select iPhone 14 as device
   - Press Cmd+R to run
   - Grant notification permission when asked

## Testing the App

1. Tap **"Start Notifications"**
2. See notifications appear every 5 seconds
3. Watch the counter increment
4. Tap **"Stop Notifications"** to stop

## Key Files Explained

| File | Purpose |
|------|---------|
| NotificationManager.swift | Handles all notification logic using UNUserNotificationCenter |
| ContentView.swift | UI with Start/Stop buttons and notification counter |
| NotificationApp.swift | App entry point (@main) |

## Production Ready

To use 5-minute intervals instead of 5 seconds:
- Edit **NotificationManager.swift** line 13
- Change `5.0` to `300.0`

## More Details

See **SETUP_AND_TESTING_GUIDE.md** for:
- Detailed step-by-step instructions
- Troubleshooting tips
- How to test on real iPhone 14
- How to modify notifications

---

**Status**: Ready to transfer to Mac and set up in Xcode ✅
