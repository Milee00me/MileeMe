//
//  DetailViewController.swif
//  ATLAS
//
//  Created by Milee Shrestha on 12/11/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var members = [String]()
    var memberAtlas = Members()
    var selectedMember = 0
    
    override func viewWillAppear(animated: Bool) {
        memberAtlas.members = memberAtlas.membersData.allKeys as [String]
        let chosenMember = memberAtlas.members[selectedMember]
        
        members = memberAtlas.membersData.objectForKey(chosenMember) as [String]
        
    }

    override func viewDidLoad() {
       // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        super.viewDidLoad()
        
                

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return members.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        

        // Configure the cell...
        
        cell.textLabel?.text=members[indexPath.row]

        return cell
    }
    


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            members.removeAtIndex(indexPath.row)
            
            let chosenContinent = memberAtlas.members[selectedMember]
            
            // deletes from the data model
            
            memberAtlas.membersData[chosenContinent]?.removeObjectAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

        let fromRow=fromIndexPath.row
        let toRow=fromIndexPath.row
        let moveMember=members[fromRow]
        members.removeAtIndex(fromRow)
        members.insert(moveMember, atIndex: toRow)
        
        //move in data model
        
        let chosenMember = memberAtlas.members[selectedMember]
        memberAtlas.membersData[chosenMember]?.removeObjectAtIndex(fromRow)
        memberAtlas.membersData[chosenMember]?.insertObject(moveMember, atIndex: toRow)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        
    }
    

}
