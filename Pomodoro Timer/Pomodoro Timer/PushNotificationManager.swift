import Foundation
import UserNotifications

class PushNotificationManager {

    private let notificationCenter = UNUserNotificationCenter.current()

    func registerForNotifications() async throws -> Bool {
        try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
    }

    func getNotificationSettings() async -> UNNotificationSettings {
        await notificationCenter.notificationSettings()
    }
}
