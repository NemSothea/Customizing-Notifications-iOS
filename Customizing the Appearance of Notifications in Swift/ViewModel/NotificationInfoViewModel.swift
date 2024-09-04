//
//  NotificationInfoViewModel.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 4/9/24.
//

import SwiftUI

// ViewModel for NotificationInfo
class NotificationInfoViewModel: ObservableObject {
    
    // Published property that updates the view when it changes
    @Published var notifications: [NotificationInfoModel]
    
    // Initialize with some default values
    init() {
        self.notifications = [
            NotificationInfoModel(
                name: "Case 1 : Long Text Notification",
                description: """
                        {
                            "aps":{
                                "alert": {
                                    "title": "WeCafé App",
                                    "body": "🤑 ចំណេញ ពេល បញ្ចូលលុយតាម　ＰＰＣ　Ｂａｎｋ　បានរៀង រាល់ ថ្ងៃ។ 💸 បញ្ចូលលុយតាម PPC Bank កាន់តែ ងាយស្រួល រហ័ស និង ចំណេញ ច្រើន តោះ កុម្ម៉ង់ Coffee ឥឡូវ នេះ 👉🏻"
                                },
                                "badge":1
                            }
                        }
            """,
                image: Image(systemName: "text.bubble")
            ),
            NotificationInfoModel(
                name: "Case 2 : Notification with a JPG Image",
                description: """
                        {
                          "aps": {
                            "content-available":1,
                             "mutable-content":"1",
                            "alert": {
                              "title": "WeCafé new items Arrived",
                              "body": "The new items in WeCafé for KOSIGNer is almost here. Have you drink it already."
                            },
                            "badge": 1,
                            "sound": "default"
                          },
                          "attachment-url": "https://static.wixstatic.com/media/1d5343_e1662d9703c74392a3e83c0b0a2f24b9~mv2.jpg"
                        }
                """,
                image: Image(systemName: "photo.artframe")
            ),
            NotificationInfoModel(
                name: "Case 3 : Notification with a PNG Image",
                description: """
                        {
                          "aps": {
                            "content-available":1,
                             "mutable-content":"1",
                            "alert": {
                              "title": "WeCafé ពិធីបុណ្យភ្ផុំបិណ្ឌ បញ្ចុះតម្លៃ  ៥០% 🥳🤝",
                              "body": "ដើម្បីអបអរសាទ័រ បុណ្យភ្ជុំបិណ្ឌ ប្រពៃណីជាតិខ្មែរ ប្រូម៉ូសិនពិសេស ពីក្រុមហ៊ុនខ្មែរ២៤ ប្រញ៉ាប់ឡើង ប្រញ៉ាប់ឡើង >>ផុតកំណត់ថ្ងៃនេះ"
                            },
                            "badge": 1,
                            "sound": "default"
                          },
                          "attachment-url": "https://png.pngtree.com/png-vector/20240820/ourlarge/pngtree-khmer-pchum-ben-day-2024-vector-png-image_13526103.png"
                        }
                """,
                image: Image(systemName: "photo.artframe.circle.fill")
            ),
            NotificationInfoModel(
                name: "Case 4 : Notification with a GIF Image",
                description: """
                       {
                         "aps": {
                           "content-available":1,
                            "mutable-content":"1",
                           "alert": {
                             "title": "WeCafé Store 🔔⚠️🔔",
                             "body": "សួស្តីចា​ ខាងហាងកាហ្វេ បានបាត់ ទឹកត្រចៀកកាំ ។​​ បើសិន ជាមានអ្នក មិនទាន់ បាន​កម្មង់ទេ​ សូម​ចូលទៅ កម្មង់ផង ណា។​ សូមអរគុណ"
                           },
                           "badge": 1,
                           "sound": "default"
                         },
                         "attachment-url": "https://media1.tenor.com/m/twFtmlVLUDQAAAAd/cat.gif"
                       }
                """,
                image: Image(systemName: "gift.fill")
            ),
            NotificationInfoModel(
                name: "Case 5 : Notification with Video",
                description: """
                        {
                           "aps" : {
                                 "content-available":1,
                             "mutable-content":1,
                              "alert" : {
                                 "title" : "Our Planet | One Planet 🌎🌎",
                                 "body" : "Experience our planet's natural beauty and examine how climate change."
                              },
                               "category" : "CustomSamplePush",
                              "sound": "default",
                              "badge": 1,
                           },
                             "attachment-url" : "https://media.istockphoto.com/id/1459585081/video/digital-abstract-network-grid-over-the-earth-artificial-intelligence-neural-network-growing.mp4?s=mp4-640x640-is&k=20&c=-vKDwYFF-onrZVZJR9hdA1V89xkq1pqG6qbKL0s9quo=",
                           "description": "28,658,750 views  Apr 17, 2020",
                           "Simulator Target Bundle": "kh.com.sothea.customnotifications"
                        }
                """,
                image: Image(systemName: "globe.europe.africa.fill")
            ),
            NotificationInfoModel(
                name: "Case 6 : Notification with Map Data",
                description: """
                      {
                         "aps" : {
                             "content-available":1,
                             "mutable-content":1,
                            "alert" : {
                               "title" : "WeCafé Store 🤩🙌🏻🗺️",
                               "body" : "Ready to start visiting? Here are some important reminders: Refer to the map below to see your visting zones and starting points."
                            },
                             "category" : "CustomSamplePush",
                            "sound": "default",
                            "badge": 1,
                         },
                         "latitude" : 11.563560095704341,
                         "longitude" : 104.88209171466077,
                         "radius" : 500,
                         "Simulator Target Bundle": "kh.com.sothea.customnotifications"
                      }
                """,
                image: Image(systemName: "map.circle")
            )
        ]
    }
    
    // You can add additional methods to update or filter notifications if needed
}
