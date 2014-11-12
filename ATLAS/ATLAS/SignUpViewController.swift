//
//  SignUpViewController.swift
//  ATLAS
//
//  Created by Milee Shrestha on 11/12/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        
        var username:NSString = nameText.text as NSString
        var password:NSString = passwordText.text as NSString
        var confirm_password:NSString = confirmPasswordText.text as NSString
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        } else if ( !password.isEqual(confirm_password) ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Passwords doesn't Match"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }
        
        
        else {
            
            var post:NSString = "username=\(username)&password=\(password)&c_password=\(confirm_password)"
            
            NSLog("PostData: %@",post);
            
            var url:NSURL = NSURL(string: "http://milee00me.wordpress.com")!
            
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
                    
                   
                   let mileeData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary

                    
                    
                    let success:NSInteger = mileeData.valueForKey("success") as NSInteger
                    
                    //[milee[@"success"] integerValue];
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Sign Up SUCCESS");
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    
                    else {
                        
                        var error_msg:NSString
                        
                        if mileeData["error_message"] as? NSString != nil {
                            error_msg = mileeData["error_message"] as NSString
                        }
                        
                        else {
                            
                            error_msg = "Unknown Error"
                        }
                        
                        var alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign Up Failed!"
                        alertView.message = error_msg
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
                }
                
                else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign Up Failed!"
                    alertView.message = "Connection Failed"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
                
            }  else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "Connection Failure"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
        }
        
    }
        
        
    
    
    
    
    @IBAction func gotoLogin(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
