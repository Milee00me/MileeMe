//
//  ViewController.swift
//  Hellomilee
//
//  Created by Shrestha Milee on 9/15/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var messageText: UILabel!
    @IBAction func buttonPressed(sender: UIButton) {
        messageText.text=sender.currentTitle + "world!"
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

