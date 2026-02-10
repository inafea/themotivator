import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate, ObservableObject {
    @Published var isNotificationEnabled = false
    @Published var notificationCount = 0

    private var timer: Timer?
    private let notificationInterval: TimeInterval = 5.0 // 5 minutes = 300 seconds, using 5 seconds for testing

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        requestNotificationPermission()
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    print("Notification permission granted")
                } else if let error = error {
                    print("Notification permission error: \(error.localizedDescription)")
                }
            }
        }
    }

    func startNotifications() {
        guard timer == nil else { return }

        isNotificationEnabled = true
        notificationCount = 0

        // Send first notification immediately
        scheduleNotification()

        // Schedule subsequent notifications every 5 seconds (300 seconds = 5 minutes in production)
        timer = Timer.scheduledTimer(withTimeInterval: notificationInterval, repeats: true) { [weak self] _ in
            self?.scheduleNotification()
        }
    }

    func stopNotifications() {
        timer?.invalidate()
        timer = nil
        isNotificationEnabled = false
    }

    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder Notification"
        content.body = "This is notification #\(notificationCount + 1)"
        content.sound = .default
        content.badge = NSNumber(value: notificationCount + 1)

        // Trigger immediately with a small delay to ensure it displays
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { [weak self] error in
            DispatchQueue.main.async {
                if error == nil {
                    self?.notificationCount += 1
                    print("Notification scheduled successfully. Count: \(self?.notificationCount ?? 0)")
                } else if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                }
            }
        }
    }

    // MARK: - UNUserNotificationCenterDelegate

    // Handle notifications when app is in foreground
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        print("Notification received in foreground")

        // Display notification even when app is in foreground
        completionHandler([.banner, .sound, .badge])
    }

    // Handle notification when user taps on it
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        print("User tapped on notification")
        completionHandler()
    }
}
