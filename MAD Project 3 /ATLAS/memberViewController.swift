//
//  memberViewController.swift
//  ATLAS
//
//  Created by Milee Shrestha on 12/11/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//


import UIKit

class memberListController: UITableViewController, UITableViewDataSource,  UITableViewDelegate{
    
    var memberList=Members()
    
    
    var tableViewController = UITableViewController(style: .Plain)
    


    
    override func viewDidLoad() {
        
        let path = NSBundle.mainBundle().pathForResource("AtlasMembers", ofType: "plist")
        
        memberList.membersData = NSMutableDictionary(contentsOfFile: path!)!
        
        memberList.members = memberList.membersData.allKeys as [String]
        
        memberList.members = Array(memberList.members).sorted(<)

        
        var refreshControl = UIRefreshControl()


        tableViewController.refreshControl = self.refreshControl
        self.refreshControl?.addTarget(self, action: "didRefreshList", forControlEvents: .ValueChanged)
        
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())")
        
        //self.view.addSubview(tableView)
        
        func didRefreshList() {
            
            self.tableViewController.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            
        }

        
        
        
        //cell height
        
        self.tableView.rowHeight = 50
        
        //tableview background
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "TableViewBg"))
        
        
        
         super.viewDidLoad()
    }
    
    
    
    
    
    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0
    }
    */
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memberList.membersData.count
        
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        
         Cell.textLabel?.text=memberList.members[indexPath.row]
        
        
        
        //index path.row by 2
        
        if (indexPath.row % 2 == 0) {
            Cell.backgroundColor = UIColor.clearColor()
            
        }
        
        else{
            Cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            Cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            
        }
        
        
        
        // Configure the cell...
        
       
        
       //NSLog(memberList.members[indexPath.row]+"!!!")
    //DOrder = checkOrder(memberList.members[indexPath.row])
       // Cell.detailTextLabel?.text =
        
        //Cell.imageView.image = UIImage(named: photos(DOrder))
        
        return Cell
    }
    
    
    
    
    
    /*

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier=="memberSegue"{
            var memberVC=segue.destinationViewController as DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow()!
            
            //sets the data for destination controller
            
            memberVC.title=memberList.members[indexPath.row]
            memberVC.memberAtlas=memberList
            memberVC.selectedMember=indexPath.row }
        
      
        
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    
   */

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}
