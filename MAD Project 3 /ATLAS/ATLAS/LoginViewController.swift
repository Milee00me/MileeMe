//
//  LoginViewController.swift
//  ATLAS
//
//  Created by Milee Shrestha on 11/12/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBAction func signInPressed(sender: UIButton) {
        
        var username:NSString = nameText.text
        var password:NSString = passwordText.text
        
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            let alertController = UIAlertController(title: "Sign in Failed!", message: "Please enter Username and Password", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            }
        
        else {
            
            var post:NSString = "username=\(username)&password=\(password)"
            
            NSLog("PostData: %@",post);
            
            // http://127.0.0.1:8888
            
           var url:NSURL = NSURL(string: "http://www.oz3.net/milee/jsonlogin2.php")!
            
           // var url:NSURL = NSURL(string: "http://localhost:8888")!

            
            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            var postLength:NSString = String( postData.length )
            
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/milee", forHTTPHeaderField: "Accept")
            
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            
            if ( urlData != nil ) {
                let res = response as NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    var error: NSError?
                    
                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
                    
                    
                    let success:NSInteger = jsonData.valueForKey("success") as NSInteger
                    
                    //[jsonData[@"success"] integerValue];
                    
                   NSLog("Success: %ld", success);
                    
                   if(success == 1)
                    {
                        NSLog("Login SUCCESS");
                        
                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(username, forKey: "USERNAME")
                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
                        prefs.synchronize()
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                   } else {
                        var error_msg:NSString
                        
                    if jsonData["error_message"] as? NSString != nil {
                            error_msg = jsonData["error_message"] as NSString
                        } else {
                            error_msg = "Unknown Error"
                        }
                    
                    
                    let alertController = UIAlertController(title: "Sign in Failed!", message: "Please enter Username and Password", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    presentViewController(alertController, animated: true, completion: nil)
                        
                    }
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Sign in Failed!", message: "Connection Failed", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    presentViewController(alertController, animated: true, completion: nil)
                    
                }
            } else {
                
                
                let alertController = UIAlertController(title: "Sign in Failed!", message: "Connection Failure", preferredStyle: .Alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                
                presentViewController(alertController, animated: true, completion: nil)
                
                if let error = reponseError {
                alertController.message = (error.localizedDescription)
                }
                
            }
        }
        
        
        
    }
    }


