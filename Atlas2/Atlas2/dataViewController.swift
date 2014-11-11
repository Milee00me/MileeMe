//
//  dataViewController.swift
//  Atlas2
//
//  Created by Milee Shrestha on 11/10/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class dataViewController: UIViewController {
    
    @IBOutlet weak var programTitle: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    
    @IBOutlet weak var termTitle: UILabel!
    
    @IBOutlet weak var programSegment: UISegmentedControl!
    
    @IBOutlet weak var yearSegment: UISegmentedControl!
    
    @IBOutlet weak var termSegment: UISegmentedControl!
    
    
    
    @IBAction func myButtonPressed(sender: UIButton) {
        
        showCourses()
    }
    
    
    func showCourses () {
        
        println("myResult is \(String(Result1))")
        
        var myVC = seconddataViewController()
        seconddataViewController.setResul1(Result1)
        
        seconddataViewController.setcourseText(courseText)

        myVC.setResult1(Result1)
        myVC.setCourseText(courseText)
        
    }
    
           override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "dataDone"{
            
            //var dataViewController: AnyObject = segue.destinationViewController
            
            if segue.destinationViewController is seconddataViewController{
            segue.destinationViewController.setResult1((String(Result1)))
            segue.destinationViewController.setcourseText((String(courseText)),
            }

    
    
    //var unit = data()

  //  @IBAction func unwindSegue (segue:UIStoryboardSegue){
        
    //    programSegment.courseText=unit.courseOne.firstCourse
    //    yearSegment.courseText=unit.courseTwo.secondCourse
   //     termSegment.courseText=unit.courseThree.thirdCourse
        
   // }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





   