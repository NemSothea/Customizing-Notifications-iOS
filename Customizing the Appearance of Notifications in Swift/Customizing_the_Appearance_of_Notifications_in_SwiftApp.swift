//
//  Customizing_the_Appearance_of_Notifications_in_SwiftApp.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 5/8/24.
//
import SwiftUI
import UserNotifications
import UserNotificationsUI

@main
struct Customizing_the_Appearance_of_Notifications_in_SwiftApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    let notificationDelegate = webCaffeeNotificationDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        registerForRemoteNotifications()
        
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
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
                
                
                center.delegate = self.notificationDelegate
                
                let shareAction = UNNotificationAction(identifier: "Share", title: "Share", options: [.foreground])
                
                let deafultCategory = UNNotificationCategory(identifier: "CustomSamplePush", actions: [shareAction], intentIdentifiers: [], options: [])
                
                center.setNotificationCategories(([deafultCategory]))
                
               
                
            case .some(let error):
                self.registerForRemoteNotifications()
                print(error.localizedDescription)
                
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
   
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNs device token: \(deviceTokenString)")
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNs registration failed: \(error)")
    }
    
}


    
    
    










