//
//  ViewController.swift
//  MileeCrossfaith
//
//  Created by Shrestha Milee on 9/16/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var crossfaithImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fontSizeNumberLabel: UILabel!
    func updateImage() {
        
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Young Crossfaith"
            crossfaithImage.image=UIImage(named: "crossfaith1.jpg")
        }
            
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="Old is gold Crossfaith"
            crossfaithImage.image=UIImage(named: "crossfaith2.jpg")
            
        }
    }
    
    func updateCaps () {
        
        if capitalizedSwitch.on {
            
            titleLabel.text=titleLabel.text?.uppercaseString
        }
        else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }

    
    @IBAction func changeFontSize(sender: UISlider) {
        
        
        let fontSize=sender.value
        fontSizeNumberLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
        
    }
    @IBOutlet weak var capitalizedSwitch: UISwitch!
       @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBAction func changeImage(sender: UISegmentedControl) {
        updateImage()
        
        updateCaps()
    }
    
    @IBAction func updateFont(sender: UISwitch) {
        
         updateCaps ()
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        imageControl.selectedSegmentIndex = -1
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

