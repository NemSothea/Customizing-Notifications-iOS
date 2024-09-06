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
import MapKit
//import WebKit
//import SafariServices

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var playerView       : UIView!
    @IBOutlet weak var imageView        : UIImageView!
    @IBOutlet weak var buttonAction     : UIButton!
    
    @IBOutlet weak var mapView          : MKMapView!
    @IBOutlet weak var titleLabel       : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var viewDetailLabel  : UILabel!
    @IBOutlet weak var stackView        : UIStackView!
    
    @IBOutlet weak var mapPointIcon     : UIImageView!
    @IBOutlet weak var locationTitleLabel: UILabel!
    // MARK: - Properties
//    var webView             : WKWebView?
    var player              : AVPlayer?
    var playerLayer         : AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
     
        // intitButton
        self.intitButton()
       
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.stopVideo()
        self.playerLayer?.removeFromSuperlayer()
        self.player = nil
        self.player?.removeObserver(self, forKeyPath: "timeControlStatus")
    }
    
    deinit {
        self.player?.removeObserver(self, forKeyPath: "timeControlStatus")
    }
    /// Apple doc: https://developer.apple.com/documentation/objectivec/nsobject/1416553-observevalue
    ///observeValue(forKeyPath:of:change:context:)
    ///Informs the observing object when the value at the specified key path relative to the observed object has changed.
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus"{
            self.updatePlayPauseButton()
        }
    }
    
    @objc private func playPauseTapped() {
        if self.player?.timeControlStatus == .playing {
            self.player?.pause()
        } else {
            self.player?.play()
        }
        self.updatePlayPauseButton()
    }
    func intitButton() {
        self.buttonAction.setImage(UIImage(systemName: "play.fill"), for: .normal)
        self.buttonAction.addTarget(self, action: #selector(self.playPauseTapped), for: .touchUpInside)
        self.buttonAction.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        self.buttonAction.layer.cornerRadius = self.buttonAction.frame.height / 2
        self.buttonAction.clipsToBounds = true
    }
    func didReceive(_ notification: UNNotification) {
        
        let content = notification.request.content
        
        // Case 1 with image & video
        if let urlString = content.userInfo["attachment-url"] as? String {
            // handle hide map case if data is not image or .mp4
            self.hideMap()
            
            if urlString.contains(".mp4") { // Handle video case
                self.imageView.isHidden = true
                self.playerView.isHidden = false
                self.playVideo(for: urlString)
                //set description
                self.getValueVideoDescription(with: content)
            } else {// Handle image case
                self.imageView.isHidden = false
                self.playerView.isHidden = true
                self.imageView(for: urlString)
            }
        }else {
            // Case 2 handle map case
            self.receiveMapData(with: content)
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
    
    // MARK: - Handle YouTube Video
    private func playVideo(for urlString: String) {
        guard let url = URL(string: urlString) else {
#if DEBUG
            print("Invalid URL string: \(urlString)")
#endif
            return
        }
        
        // Option 1: Using WKWebView
        //           self.openVideoWithWebkit(with: url)
        
        // Option 2: Using SFSafariViewController
        //           self.openWithSFSafariView(with: url)
        
        // Option 3: Utilize AVPlayer for Video Playback
        self.openWithPlay(with: url)
        
    }
    func getValueVideoDescription(with content: UNNotificationContent) {
    
        let aps     = content.userInfo["aps"] as? NSDictionary
        let alert   = aps?["alert"] as? NSDictionary
        
        if let title = alert?["title"] as? String,
           let body = alert?["body"] as? String, let description = content.userInfo["description"] as? String  {
            self.titleLabel.text        = title
            self.descriptionLabel.text  = body
            self.viewDetailLabel.text   = description
        }
    }
    func updatePlayPauseButton() {
        if self.player?.timeControlStatus == .playing {
            self.buttonAction.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        } else {
            self.buttonAction.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    func receiveMapData(with map : UNNotificationContent) {
        
        let userInfo = map.userInfo
        
        guard let latitude = userInfo["latitude"] as? CLLocationDistance,
              let longitude = userInfo["longitude"] as? CLLocationDistance,
              let radius = userInfo["radius"] as? CLLocationDistance else {
            return
        }
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        let aps     = map.userInfo["aps"] as? NSDictionary
        let alert   = aps?["alert"] as? NSDictionary
        
        if let title = alert?["title"] as? String {
            self.locationTitleLabel.text = "New location : \(title)"
        }
        
        self.hideView()
        self.mapView.setRegion(region, animated: false)
        self.view.layoutIfNeeded()
    }
    func hideView() {
        self.playerView.isHidden     = true
        self.stackView     .isHidden = true
    }
    func hideMap() {
        self.mapView.isHidden            = true
        self.mapPointIcon.isHidden       = true
        self.locationTitleLabel.isHidden = true
        
    }
   // MARK: - Helper Functions
//    func openVideoWithWebkit(with url: URL) {
//        if self.webView == nil {
//            self.webView = WKWebView(frame: self.playerView.bounds)
//            if let webView = self.webView {
//                webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                self.playerView.addSubview(webView)
//            }
//        }
//        self.webView?.load(URLRequest(url: url))
//    }
    
    /**
     @class SFSafariViewController
     A view controller for displaying web content in a Safari-like interface with some of Safari’s features.
     */
//    func openWithSFSafariView(with url: URL) {
//        // If you prefer using SFSafariViewController instead of WKWebView, use the following:
//        let safariVC = SFSafariViewController(url: url)
//        present(safariVC, animated: true, completion: nil)
//    }
    
    // Initialize AVPlayer with the video URL
    func openWithPlay(with url: URL) {
        self.player = AVPlayer(url: url)
        
        // Create an AVPlayerLayer and add it to the playerView
        self.playerLayer = AVPlayerLayer(player: player)
        self.playerLayer?.frame = playerView.bounds
        self.playerLayer?.videoGravity = .resizeAspectFill
        self.playerView.layer.addSublayer(playerLayer!)
  
        // Start video playback
//           self.player?.play()
        self.playerView.bringSubviewToFront(buttonAction)
        
        // Start observing the player's status
        self.player?.addObserver(self, forKeyPath:"timeControlStatus", options: [.initial, .new], context: nil)
    }
    
   
    func stopVideo() {
        self.player?.pause()
        self.player?.seek(to: .zero)
        self.updatePlayPauseButton()
    }
}

extension URLSession {
    
    class func downloadImage(atURL url: URL, withCompletionHandler completionHandler: @escaping (Data?, NSError?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            completionHandler(data, nil)
        }
        dataTask.resume()
    }
}
