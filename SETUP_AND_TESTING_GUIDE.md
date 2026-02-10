# iOS Notification App - Setup & Testing Guide

## 📋 Files Created

Three Swift source files have been created for your iOS notification app:

1. **NotificationApp.swift** - Main app entry point
2. **ContentView.swift** - UI with controls and counter
3. **NotificationManager.swift** - Notification scheduling logic

## 🖥️ Requirements to Run This App

- **macOS** (10.15 or later)
- **Xcode 13+** (preferably Xcode 14 or later)
- **iOS 15+** target deployment

## 📱 Step 1: Create Xcode Project (On Your Mac)

Since this code is on Windows, you'll need to transfer it to a Mac and set up an Xcode project. Here's how:

### Option A: Manual Setup in Xcode

1. **Open Xcode** on your Mac
2. **Create a new project**:
   - File → New → Project
   - Select "iOS"
   - Choose "App" template
   - Click "Next"

3. **Configure project**:
   - Product Name: `NotificationApp` (or your preferred name)
   - Organization Identifier: `com.yourname` (e.g., `com.myprojects`)
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Click "Next"
   - Choose a location to save (you can use your git directory)

4. **Replace the generated files**:
   - Delete the auto-generated `NotificationAppApp.swift` and `ContentView.swift`
   - Copy the three `.swift` files from this project into your Xcode project's folder

5. **Refresh in Xcode**:
   - Right-click on the project navigator
   - Select "Add Files to NotificationApp..."
   - Add the three Swift files

### Option B: Automated Project Creation

Alternatively, transfer these three files to your Mac and drag them into an Xcode project window.

## 🚀 Step 2: Build and Run on iPhone 14 Simulator

1. **Select iPhone 14 Simulator**:
   - In Xcode top toolbar, click the device selector (shows current selection)
   - Find and select "iPhone 14"
   - Make sure it says "iPhone 14" not "Any Device" or "Generic Device"

2. **Build the project**:
   - Product → Build (or Cmd+B)
   - Wait for build to complete (you should see "Build Succeeded")

3. **Run the app**:
   - Click the **Play** button in the top-left (or press Cmd+R)
   - Xcode will start the simulator
   - The app will launch on iPhone 14 simulator

## 📲 Step 3: Grant Notification Permission

When the app first launches:

1. You'll see a dialog asking "Allow NotificationApp to send you notifications?"
2. Tap **"Allow"** to enable notifications
3. This is required for the notifications to work

## ✅ Step 4: Test the App

### Test Scenario 1: Start and Observe Notifications

1. **Tap "Start Notifications"** button in the app
2. You should see:
   - The status change to "Notifications Active" (green indicator)
   - Notification counter starts at 1
   - A notification banner will appear at the top of the screen

3. **Wait 5 seconds** (in testing mode - 5 minutes in production)
4. Another notification will automatically appear
5. The counter increments with each notification

### Test Scenario 2: Multiple Notifications

1. Keep the app open in foreground
2. Wait about 30 seconds
3. You should see 6-7 notifications total (at 5-second intervals)
4. Counter should show 6 or 7

### Test Scenario 3: Stop Notifications

1. **Tap "Stop Notifications"** button
2. The green indicator changes to red "Notifications Inactive"
3. No more notifications will appear
4. The counter stays at its current value

## ⏱️ Timing Details

**Important**: The current configuration uses **5 seconds** for testing purposes. To change to actual 5-minute intervals:

1. Open `NotificationManager.swift`
2. Find this line (around line 13):
   ```swift
   private let notificationInterval: TimeInterval = 5.0 // 5 minutes = 300 seconds, using 5 seconds for testing
   ```
3. Change `5.0` to `300.0` for actual 5-minute intervals:
   ```swift
   private let notificationInterval: TimeInterval = 300.0 // 5 minutes
   ```
4. Rebuild and test

## 🐛 Troubleshooting

### "Build Failed" Error
- **Fix**: Go to Product → Clean Build Folder (Shift+Cmd+K), then rebuild

### App Crashes on Launch
- **Fix**: Make sure the iOS 15+ target deployment is set:
  - Select project in left panel
  - Select "NotificationApp" target
  - Go to General tab
  - Check minimum iOS version is 15 or higher

### Notifications Not Appearing
- **Verify**:
  1. Did you tap "Allow" on the permission dialog?
  2. Is the status showing "Notifications Active"?
  3. Open Console (in Xcode: View → Debug Area → Show Console)
  4. You should see log statements like "Notification scheduled successfully"

### Simulator Not Running
- **Fix**:
  - Click the device selector in Xcode toolbar
  - Select "iPhone 14"
  - If it doesn't show, go to Window → Devices and Simulators → tap the + button and create a new simulator

## 📊 What to Verify

- ✅ App launches without errors
- ✅ Permission dialog appears on first launch
- ✅ "Start Notifications" button works
- ✅ Status changes to "Active" when running
- ✅ Notification counter increments correctly
- ✅ Notifications appear as banners (5-second intervals during testing)
- ✅ "Stop Notifications" button stops the timer
- ✅ Counter remains when stopped

## 🔧 Testing on Real iPhone 14

Once you've verified it works in the simulator:

1. **Connect real iPhone 14** to your Mac via USB
2. **Trust the computer** on the iPhone when prompted
3. In Xcode, select your iPhone in the device selector instead of simulator
4. Click Play to run on the real device
5. Same testing steps apply

## 📝 Project Structure

```
NotificationApp/
├── NotificationApp.swift       // Main app file
├── ContentView.swift           // UI layout and buttons
├── NotificationManager.swift   // Notification logic
└── Assets.xcassets/           // App icons and assets (auto-generated by Xcode)
```

## 🎓 Key Concepts Explained

- **UNUserNotificationCenter**: Apple's framework for managing local and remote notifications
- **UNNotificationRequest**: Creates a notification with content and scheduling
- **Timer**: Repeating task that triggers every 5 seconds (or 300 seconds for production)
- **@Published**: SwiftUI property that updates the UI when its value changes
- **UNUserNotificationCenterDelegate**: Handles notification behavior when app is open

## Next Steps

- Test different notification messages by modifying the `notification.title` and `notification.body` in `NotificationManager.swift`
- Add sound feedback by modifying the notification `sound` property
- Deploy to App Store (requires Apple Developer Account)

---

If you run into any issues, check the Xcode Console for error messages or log outputs!
