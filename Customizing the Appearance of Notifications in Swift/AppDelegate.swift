//
//  AppDelegate.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 5/9/24.
//

import UserNotifications
import UserNotificationsUI

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    /*
     Custom action on AppDelegate :
        example : Share, other actions
     */
    let notificationDelegate = webCaffeeNotificationDelegate()
    
    //MARK: - Application Launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        self.registerForRemoteNotifications()
        
        return true
    }
    //MARK: - registerForRemoteNotifications
    public func registerForRemoteNotifications() {
        let center      =  UNUserNotificationCenter.current()
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        center.requestAuthorization(options: authOptions) { (granted, error) in
            
            switch error {
            case .none:
                if granted {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
                // Set the delegate for handling notification behavior
                center.delegate = self.notificationDelegate
                // Create a custom action (e.g., "Share") that can be displayed on the notification
                let shareAction = UNNotificationAction(identifier: "Share", title: "Share", options: [.foreground])
                // Create a custom category for the notification, associating it with the custom action
                let deafultCategory = UNNotificationCategory(identifier: "CustomSamplePush", actions: [shareAction], intentIdentifiers: [], options: [])
                
                center.setNotificationCategories(([deafultCategory]))
            case .some(let error):
                self.registerForRemoteNotifications()
            }
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let data = response.notification.request.content.userInfo as? [String : Any] {
            print("Notification data : \(data) and action : \(response.actionIdentifier)")
        }
        completionHandler()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.badge,.banner])
    }
   // MARK: - RemoteNotifications DeviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNs device token: \(deviceTokenString)")
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNs registration failed: \(error)")
    }
}
