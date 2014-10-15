//
//  secondViewController.swift
//  milee_favorites
//
//  Created by Milee Shrestha on 10/7/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userBook: UITextField!
    @IBOutlet weak var userAuthor: UITextField!
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
            if segue.identifier == "doneFavs"
    {
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController
            
            scene1ViewController.user.favBook=userBook.text
            scene1ViewController.user.favAuthor=userAuthor.text
        }
    }


    override func viewDidLoad() {
        
        userBook.delegate=self
        userAuthor.delegate=self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
