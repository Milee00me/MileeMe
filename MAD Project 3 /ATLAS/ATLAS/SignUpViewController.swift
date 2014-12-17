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
            
            let alertController = UIAlertController(title: "Sign Up Failes", message: "Please enter Username and Password", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
            
        } else if ( !password.isEqual(confirm_password) ) {
            
            let alertController = UIAlertController(title: "Sign Up Failed!", message: "Passwords doesn't Match", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        
        else {
            
            var post:NSString = "username=\(username)&password=\(password)&c_password=\(confirm_password)"
            
            NSLog("PostData: %@",post);
            
            var url:NSURL = NSURL(string: "http://www.oz3.net/milee/jsonsignup.php")!
            
           // var url:NSURL = NSURL(string: "http://localhost:8888")!
            
            
           // http://localhost:8888

            
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
                    
                    //[milee[@"success"] integerValue];
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Sign Up SUCCESS");
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    
                    else {
                        
                        var error_msg:NSString
                        
                        if jsonData["error_message"] as? NSString != nil {
                            error_msg = jsonData["error_message"] as NSString
                        }
                        
                        else {
                            
                            error_msg = "Unknown Error"
                        }
                        
                        let alertController = UIAlertController(title: "Sign Up Failed!", message: "Error Message", preferredStyle: .Alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        presentViewController(alertController, animated: true, completion: nil)

                    }
                    
                }
                
                else {
                    
                    let alertController = UIAlertController(title: "Sign Up Failed", message: "Connection Failed", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    presentViewController(alertController, animated: true, completion: nil)
                    
                }
                
            }  else {
                
                
                
                let alertController = UIAlertController(title: "Sign Up Failed!", message: "Connection Failure", preferredStyle:
                    .Alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                
                presentViewController(alertController, animated: true, completion: nil)

                if let error = reponseError {
                    alertController.message = (error.localizedDescription)
                }
                
                    }
        }
        
    }
        
        
    
    
    
    
    @IBAction func gotoLogin(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
