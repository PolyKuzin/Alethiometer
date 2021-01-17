//
//  Notifications.swift
//  Gliese_581
//
//  Created by Павел Кузин on 17.01.2021.
//

import UIKit
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    //MARK: - Notifications
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        let useerAction = "User Action"
        content.title = "Чуем прекрасные выходные!".localized()
        content.body  = "Запланировали что-то важное? Убедитесь, что для этого благоприятные условия".localized()
        content.sound = UNNotificationSound.defaultCritical
        content.badge = 1
//        content.categoryIdentifier = "User Action"
        
        var dateComponents = DateComponents()
//        dateComponents.hour = 19
//        dateComponents.minute = 30
//        dateComponents.weekday = 6
        dateComponents.second = 2
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,repeats: true)
        let identifire = "RowsAddedNotification"
        let reequest = UNNotificationRequest(identifier: identifire, content: content, trigger: trigger)
        notificationCenter.add(reequest) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: "User Action", actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        notificationCenter.setNotificationCategories([category])
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "RowsAddedNotification" {
//            UserDefaults.standard.setValue(0, forKey: "RowsAdded")
        }
        
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default Action")
        case "Snooze":
            print("Snooze")
            // scheduleNotiffication(notificationType: "Reminder")
        case "Delete" :
            print("Delete notification")
        default: break
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
