//
//  NotificationService.swift
//  Service
//
//  Created by sothea007 on 6/8/24.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        // 1. Check for custom content
        guard let bestAttemptContent = bestAttemptContent, let mediaURL = bestAttemptContent.userInfo["attachment-url"] as? String, let attachmentURL = URL(string: mediaURL) else {
            return
        }
        // 2. Download the image, mp4 and pass it to attachments if not nil
        self.downloadImageFrom(url: attachmentURL) { (attachment) in
            if attachment != nil {
                bestAttemptContent.attachments = [attachment!]
                contentHandler(bestAttemptContent)
            }
        }
    }
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}

// MARK: - Multi Media Helper
extension NotificationService {
    
    private func downloadImageFrom(url: URL, with completionHandler: @escaping (UNNotificationAttachment?) -> Void) {
        let task = URLSession.shared.downloadTask(with: url) { (downloadedUrl, response, error) in
            guard let downloadedUrl = downloadedUrl else {
                completionHandler(nil)
                return
            }
            let fileExtension = self.determineFileExtension(from: url, response: response)
            
            // 1. Application directory path
            var urlPath = URL(fileURLWithPath: NSTemporaryDirectory())
            // 2. Validate the content extension. If file is unsupported. Fallback will happend and basic Push Notifcation will be delivered
            let urlPathExt = ProcessInfo.processInfo.globallyUniqueString + fileExtension // .png, . gif, .jpg, .mp4.
            urlPath = urlPath.appendingPathComponent(urlPathExt)
            
            do {
                // 3. Move downloadedUrl to newly created urlPath
                try FileManager.default.moveItem(at: downloadedUrl, to: urlPath)
                let attachment = try UNNotificationAttachment(identifier: "attachment", url: urlPath, options: nil)
                completionHandler(attachment)
            }
            catch {
                completionHandler(nil)
            }
        }
        task.resume()
    }
    private func determineFileExtension(from url: URL, response: URLResponse?) -> String {
        if let mimeType = response?.mimeType {
            if mimeType == "video/mp4" {
                return ".mp4"
            } else if mimeType == "image/jpeg" {
                return ".jpg"
            } else if mimeType == "image/png" {
                return ".png"
            } else if mimeType == "image/gif" {
                return ".gif"
            }
        }
        
        // If MIME type is not available, fallback to file extension from the URL
        return url.pathExtension.isEmpty ? ".dat" : ".\(url.pathExtension)"
    }
}

