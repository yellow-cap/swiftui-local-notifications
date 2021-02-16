import SwiftUI

struct ContentView: View {
    let notificationManager: NotificationManager

    var body: some View {
        VStack {
            Text("Notification will appear in 10 sec")
            Button(action: scheduleNotification) {
                Text("Schedule notification")
            }
                    .padding()
        }
                .padding()
    }

    private func scheduleNotification() {
        let notificationId = UUID()
        let content = UNMutableNotificationContent()
        content.body = "New notification \(notificationId)"
        content.sound = UNNotificationSound.default
        content.userInfo = [
            "notificationId": "\(notificationId)" // additional info to parse if need
        ]

        let trigger = UNCalendarNotificationTrigger(
                dateMatching: NotificationHelper.getTriggerDate()!,
                repeats: false
        )

        notificationManager.scheduleNotification(
                id: "\(notificationId)",
                content: content,
                trigger: trigger)
    }
}