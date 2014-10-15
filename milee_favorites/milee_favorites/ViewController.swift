//
//  ViewController.swift
//  milee_favorites
//
//  Created by Milee Shrestha on 10/7/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bookLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    var user=Favorite()
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        bookLabel.text=user.favBook
        authorLabel.text=user.favAuthor
        
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

