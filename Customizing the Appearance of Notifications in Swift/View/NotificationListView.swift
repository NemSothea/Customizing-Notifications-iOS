//
//  NotificationView.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 4/9/24.
//

import SwiftUI

struct NotificationListView: View {
    
    // ViewModel to manage the notifications
    @StateObject var viewModel = NotificationInfoViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.notifications) { notification in
                NavigationLink(notification.name, value: notification)
            }
            .navigationTitle("Notifications Style")
            .navigationDestination(for: NotificationInfoModel.self) { notification in
                NotificationDetail(userInfo: notification)
            }
        }
    }
    
}
