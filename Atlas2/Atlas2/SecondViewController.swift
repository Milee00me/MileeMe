//
//  SecondViewController.swift
//  Atlas2
//
//  Created by Milee Shrestha on 11/6/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var atlasWebView: UIWebView!
    @IBOutlet weak var atlasSpinner: UIActivityIndicatorView!
    
    func loadWebPage(urlString: String){
        //the string passed should be a properly formed url
        let url = NSURL(string: urlString) //creates a NSURL object with the string passed in
        let request = NSURLRequest(URL: url!) //creates a NSURLRequest object
        atlasWebView.loadRequest(request) //loads the NSURLRequest object in our web view
    }
    
    override func viewDidLoad() {
        atlasWebView.delegate=self
        
        loadWebPage("http://atlas.colorado.edu")
        
        super.viewDidLoad()
    }
    
    //UIWebViewDelegate method that is called when a web page begins to load
    func webViewDidStartLoad(webView: UIWebView) {
        atlasSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads successfully
    func webViewDidFinishLoad(webView: UIWebView) {
        atlasSpinner.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

