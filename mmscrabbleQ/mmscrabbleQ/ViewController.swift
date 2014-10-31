//
//  ViewController.swift
//  mmscrabbleQ
//
//  Created by Milee Shrestha on 10/31/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var allwords = NSDictionary()

    var letters = [String]()
    
    override func viewDidLoad() {
        
        //use a NSBundle object of the directory for our application to retrieve the pathname of qwordswithoutu1.plist
        
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu2", ofType: "plist")
        
        //load the words of the plist file into the array
        
        allwords = NSDictionary(contentsOfFile: path!)
        
        //puts all the letters in an array
        

        letters = allwords.allKeys as [String]
        
        // sorts the array
        
        letters.sort({$0 < $1})

        //words = NSArray(contentsOfFile: path!) as Array
        super.viewDidLoad()
    }
    
    
    //Required methods for UITableViewDataSource
    
    // Customize the number of rows in the section
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return words.count
        
        let letter = letters[section]
        let letterSection = allwords.objectForKey(letter) as [String]
        return letterSection.count
    }
    
    // Displays table view cells
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords.objectForKey(letter) as [String]
        
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        //set the text of the cell
        cell.textLabel?.text=wordsSection[indexPath.row]
        
       // cell.detailTextLabel?.text="Q no U"
        
        //cell.imageView?.image=UIImage(named: "scrabbletile90.png")
        
        return cell
    }
    
    //UITableViewDelegate method that is called when a row is selected
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       // let alert = UIAlertController(title: "Row selected", message: "You selected \(words[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        
        let section = indexPath.section
        
        let letter = letters[section]
        
        let wordsSection = allwords.objectForKey(letter) as [String]
        
        let alert = UIAlertController(title: "Row selected", message: "You selected \(wordsSection[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
        alert.addAction(okaction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        //deselects the row that had been choosen
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
       // let okaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
        //alert.addAction(okaction)
        
        //self.presentViewController(alert, animated: true, completion: nil)
        
        //deselects the row that had been choosen
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }

    //UITableViewDatasource method
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return letters.count
    }
    
    //Sets the header value for each section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return letters[section]
    }
    
    //adds a section index
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return letters
    }
    

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

