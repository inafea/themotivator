import SwiftUI

struct ContentView: View {
    @StateObject private var notificationManager = NotificationManager()

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Notification Scheduler")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Status Section
            VStack(spacing: 12) {
                HStack {
                    Circle()
                        .fill(notificationManager.isNotificationEnabled ? Color.green : Color.red)
                        .frame(width: 12, height: 12)

                    Text(notificationManager.isNotificationEnabled ? "Notifications Active" : "Notifications Inactive")
                        .font(.headline)

                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)

                // Notification Counter
                VStack(spacing: 8) {
                    Text("Notifications Sent")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("\(notificationManager.notificationCount)")
                        .font(.system(size: 48, weight: .bold, design: .default))
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .padding()

            // Control Buttons
            VStack(spacing: 12) {
                Button(action: {
                    notificationManager.startNotifications()
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Start Notifications")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .disabled(notificationManager.isNotificationEnabled)

                Button(action: {
                    notificationManager.stopNotifications()
                }) {
                    HStack {
                        Image(systemName: "stop.fill")
                        Text("Stop Notifications")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .disabled(!notificationManager.isNotificationEnabled)
            }
            .padding()

            // Info Section
            VStack(alignment: .leading, spacing: 8) {
                Text("How it works:")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 6) {
                    InfoRow(number: 1, text: "Tap 'Start Notifications'")
                    InfoRow(number: 2, text: "Grant notification permission if asked")
                    InfoRow(number: 3, text: "Notifications appear every 5 seconds (5 minutes in production)")
                    InfoRow(number: 4, text: "Counter shows total notifications sent")
                    InfoRow(number: 5, text: "Tap 'Stop Notifications' to cancel")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

struct InfoRow: View {
    let number: Int
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.blue)
                .frame(width: 24, height: 24)
                .overlay(
                    Text("\(number)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                )

            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    ContentView()
}
