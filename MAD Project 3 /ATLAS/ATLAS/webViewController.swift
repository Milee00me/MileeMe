//
//  webViewController.swift
//  ATLAS
//
//  Created by Milee Shrestha on 12/15/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//


import UIKit
import AVFoundation

class webViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var urlPath = "http://atlas.colorado.edu"
    var audioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kevin_toney_kings", ofType: "mp3")!)
        println(alertSound)
        
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        loadAddressURL()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadAddressURL(){
        let requestURL = NSURL(string: urlPath)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        
        
}
        

}






