//
//  ViewController.swift
//  countries8
//
//  Created by Milee Shrestha on 10/23/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var continentList=Continents()
    

    override func viewDidLoad() {
        
        //Use NSBundle Object of the directory for our application to retrieve the pathname of the qwordswithouru1.plist
        //NSLog("view load")
        let path = NSBundle.mainBundle().pathForResource("continents", ofType:"plist")
        
        //Load th words if the plist file into the array
        
        continentList.continentData = NSMutableDictionary(contentsOfFile: path!)
        
        // gets all keys which are the continents
        
        continentList.continents = continentList.continentData.allKeys as [String]
        
        //object and instance variable defined in continents.swift
       // NSLog("\(continentList.continents)")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //required methods for UITableViewDataSource
    
    //Customize the number of rows in the section
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return continentList.continentData.count
    }
    
    //Displays table view cells
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        //set the text of the cell
        cell.textLabel?.text=continentList.continents[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier=="countrysegue"{
            
            var countryVC=segue.destinationViewController as DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow()!
            
            //sets the data for the destination controller
            
            countryVC.title=continentList.continents[indexPath.row]
            countryVC.continentCountries=continentList
            countryVC.selectedContinent=indexPath.row
            
        }
            
        else if segue.identifier=="continentsegue"{
            
            var infoVC=segue.destinationViewController as continentinfoTableViewController
            
            let editingCell:UITableViewCell=sender as UITableViewCell
            
            let indexPath:NSIndexPath=tableView.indexPathForCell(editingCell)!
            
            infoVC.name=continentList.continents[indexPath.row]
            
            let countries=continentList.continentData.objectForKey(infoVC.name) as [String]
            
            infoVC.number=String(countries.count)
        }
    }

      override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

