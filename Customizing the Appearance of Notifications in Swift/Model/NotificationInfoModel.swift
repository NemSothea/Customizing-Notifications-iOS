//
//  NotificationInfo.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 4/9/24.
//

import Foundation
import SwiftUI

struct NotificationInfoModel: Identifiable, Hashable {
    
    var id          = UUID()
    let name        : String
    let description : String
    let image       : Image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(description)
    }

}

