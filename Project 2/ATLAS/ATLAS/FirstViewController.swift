//
//  FirstViewController.swift
//  ATLAS
//
//  Created by Milee Shrestha on 11/11/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        
        if (isLoggedIn != 1){
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
            
        else {
            self.nameLabel.text = prefs.valueForKey("USERNAME") as NSString
        }
    }

   // @IBAction func logOutPressed(sender: UIButton) 
    
   // func logOutPressed()
    
   // {
    
    
        
      //  let appDomain = NSBundle.mainBundle().bundleIdentifier
     //   NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
      // self.performSegueWithIdentifier("loginSegue", sender: self)

   // }

}

