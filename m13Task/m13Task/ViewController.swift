//
//  ViewController.swift
//  m13Task
//
//  Created by Milee Shrestha on 11/20/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    let kFilename = "archive2"
    var dataFilePath=DataManager()
    var taskArchive = Task()
    

    @IBOutlet weak var task1: UITextField!
    @IBOutlet weak var task2: UITextField!
    @IBOutlet weak var task3: UITextField!
    @IBOutlet weak var task4: UITextField!
    
    override func viewDidLoad() {
        
        task1.delegate=self
        task2.delegate=self
        task3.delegate=self
        task4.delegate=self

        
        let filepath = dataFilePath.docFilePath(kFilename)
        let fileManager = NSFileManager.defaultManager()
        
        
        if fileManager.fileExistsAtPath(filepath!) {
            
            
                let data = NSData(contentsOfFile: filepath!)
            
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            
            taskArchive = unarchiver.decodeObjectForKey("data") as Task
            
            unarchiver.finishDecoding()
            
            
            task1.text=taskArchive.tasks[0] as String
            task2.text=taskArchive.tasks[1] as String
            task3.text=taskArchive.tasks[2] as String
            task4.text=taskArchive.tasks[3] as String
            
        }

        
       // let app = UIApplication.sharedApplication()
        
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: "UIApplicationWillResignActiveNotification", object: app)
            
            let app = UIApplication.sharedApplication()
            //application instance
            //subscribe to the UIApplicationWillResignActiveNotification notification
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: "UIApplicationWillResignActiveNotification", object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func applicationWillResignActive(notification: NSNotification){
        
        let filepath = dataFilePath.docFilePath(kFilename)
        
        
        taskArchive.tasks[0]=task1.text
        taskArchive.tasks[1]=task2.text
        taskArchive.tasks[2]=task3.text
        taskArchive.tasks[3]=task4.text

        
        var data = NSMutableData()
        
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        
        archiver.encodeObject(taskArchive, forKey: "Data")
        
        archiver.finishEncoding()
        
        data.writeToFile(filepath!, atomically: true)
        
        
       // data.addObject(task1.text)
        //data.addObject(task2.text)
       // data.addObject(task3.text)
        //data.addObject(task4.text)
      
    }
        func textFieldShouldReturn(textField: UITextField!) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}

        
      