//
//  NotificationViewController.swift
//  Content
//
//  Created by sothea007 on 6/8/24.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import AVKit
import XCDYouTubeKit

class NotificationViewController: UIViewController, UNNotificationContentExtension {
  
    

    // MARK: - @IBOutlet
    @IBOutlet var label             : UILabel?
    @IBOutlet weak var playerView   : UIView!
    @IBOutlet weak var imageView    : UIImageView!
    
    // MARK: - @Properties
    var playerController    : AVPlayerViewController!
    let standardHeight      : CGFloat = 432
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
 
    }
    
    func didReceive(_ notification: UNNotification) {

      
        
        let content = notification.request.content
        print("content",content)
        
        
        // Case 1 with image
//        if let urlImageString = content.userInfo["attachment-url"] as? String {
//            self.imageView.isHidden = false
//            self.playerView.isHidden = true
//            self.imageView(for: urlImageString)
//        }
//        
        // Case 2 with video
        playerController = AVPlayerViewController()
        if let videoId = content.userInfo["videoId"] as? String {
     

            self.videoView(for: videoId)
        }
       
    }
    //MARK: Case 1 with image
    private func imageView(for urlImageString : String) {
        if let url = URL(string: urlImageString) {
            URLSession.downloadImage(atURL: url) { [weak self] (data, error) in
                if let _ = error {
                    return
                }
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    //MARK: Case 2 with video
    private func videoView(for videoId : String ) {
        
    
    XCDYouTubeClient.default().getVideoWithIdentifier("RDWxtwBYIy0ZU&start_radio=1") { (video, error) in
           
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let video = video else {
                print("No video found")
                return
            }
            
            let streamURLS = video.streamURLs
            if let url = streamURLS[XCDYouTubeVideoQuality.medium360] ?? streamURLS[XCDYouTubeVideoQuality.small240] ?? streamURLS[XCDYouTubeVideoQuality.HD720] ?? streamURLS[18] {
                self.setupPlayer(with: url)
            } else {
                print("No valid stream URL found")
            }
        }
    }
    private func setupPlayer(with url: URL) {
        let player = AVPlayer(url: url)
        playerController.player = player
        playerController.view.frame = self.playerView.bounds
        playerView.addSubview(playerController.view)
        addChild(playerController)
        playerController.didMove(toParent: self)
        player.play()
    }

}

extension URLSession {
    
    class func downloadImage(atURL url: URL, withCompletionHandler completionHandler: @escaping (Data?, NSError?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            completionHandler(data, nil)
        }
        dataTask.resume()
    }
}
