//
//  NotificationDetail.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 4/9/24.
//

import SwiftUI



struct NotificationDetail: View {
    
    let userInfo : NotificationInfoModel
    
    var body: some View {
        VStack {
           
            userInfo.image
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            Text(userInfo.name)
                .font(.system(size: 24))
            
            CodePreview(code: prettyPrintedJSON(from: userInfo.description))
          
            
        }
        .padding()
    }
    // Helper function to format JSON string
        func prettyPrintedJSON(from jsonString: String) -> String {
            let data = jsonString.data(using: .utf8)!
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                return String(data: prettyData, encoding: .utf8) ?? jsonString
            } catch {
                return jsonString // return original if JSON parsing fails
            }
        }
}

#Preview {
    NotificationDetail(userInfo: NotificationInfoModel(
        name: "Case 1: Long Text Notification ",
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
            image: Image(systemName: "list.clipboard.fill")))
}
