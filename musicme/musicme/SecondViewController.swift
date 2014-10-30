//
//  SecondViewController.swift
//  musicme
//
//  Created by Milee Shrestha on 10/29/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var musicWebView: UIWebView!
    
    @IBOutlet weak var musicSpinner: UIActivityIndicatorView!
    
    
    func loadWebPage(urlString: String){
        //the string passed should be a properly formed url
        let url = NSURL(fileURLWithPath: urlString) //creates a NSURL object with the string passed in
        let request = NSURLRequest(URL: url!) //creates a NSURLRequest object
        musicWebView.loadRequest(request) //loads the NSURLRequest object in our web view
    }
    
    override func viewDidLoad() {
        
        musicWebView.delegate=self
        loadWebPage("https://www.apple.com/itunes")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //UIWebViewDelegate method that is called when a web page begins to load
    func webViewDidStartLoad(webView: UIWebView) {
        musicSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads successfully
    func webViewDidFinishLoad(webView: UIWebView) {
        musicSpinner.stopAnimating()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

