//
//  ViewController.swift
//  sportsmilee
//
//  Created by Shrestha Milee on 9/10/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var sportsmilee: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func chooseVehicle(sender: UIButton) {
        if sender.tag==1
        {
        sportsmilee.image=UIImage(named: "RacingCar.png")
            messageLabel.text="I am a Racing car fan too" +
            "\(nameField.text)"
            
            //no spacing
        }
        if sender.tag==2
        {
        sportsmilee.image=UIImage (named: "RacingMotorcycle.png")
            messageLabel.text="Get ready for Motorcyle Race" +
            "\(nameField.text)"
        }
    }
    
    @IBAction func textFieldDoneEditing(sender: AnyObject) {
        nameField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

