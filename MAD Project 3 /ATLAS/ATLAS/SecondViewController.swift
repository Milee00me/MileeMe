//
//  SecondViewController.swift
//  ATLAS
//
//  Created by Milee Shrestha on 11/11/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var atlasLabel: UILabel!

    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    @IBOutlet weak var ProgramSegment: UISegmentedControl!
    @IBOutlet weak var YearSegment: UISegmentedControl!
    @IBOutlet weak var TermSegment: UISegmentedControl!
    
  //  @IBOutlet weak var courseView: UITextView!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var firstCourse: UILabel!
    @IBOutlet weak var secondCourse: UILabel!
    
    @IBOutlet weak var thirdCourse: UILabel!
   
   // @IBAction func courseDescription(sender: AnyObject) 
        func writeResult(){
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==0 {
            
            result.text="Master's, 1st Year, Spring Term"
            firstCourse.text="1. Fieldwork Methods"
            secondCourse.text="2. Global Development II"
            thirdCourse.text="3. Technology Elective"
        }
        //M1F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
            
            result.text="Master's, 1st Year, Fall Term"
            firstCourse.text="1. ICTD Case Studies"
            secondCourse.text="2.  Global Development I"
            thirdCourse.text="3. Technology Elective"
        }
        
        //M2S
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==0 {
            
            result.text="Master's, 1st Year, Fall Term"
            firstCourse.text="1. Practicum"
            secondCourse.text="2. Global Development II"
            thirdCourse.text="3. Technology Elective"
            
        }
        //M2F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==1 {
            
            
            result.text="Master's, 2nd Year, Spring Term"
            firstCourse.text="1. ICTD Laboratory"
            secondCourse.text="2. Domain-specific elective"
            thirdCourse.text="3. Qualitative Analysis"
            
            
           
        }
        //P1S
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==0 {
            
            result.text="PhD, 1st Year, Spring Term"
            firstCourse.text="1. PhD Seminar"
            secondCourse.text="2. Quantitative Analysis"
            thirdCourse.text="3. Qualitative Analysis"
            

        }
        //P1F
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
            
            result.text="PhD, 1st Year, Fall Term"
            firstCourse.text="1. PhD Seminar"
            secondCourse.text="2. Additional Courses"
            thirdCourse.text="3. Teaching Assistantship"
           
        }
        
        //P2S
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==0 {
            
            result.text="PhD, 2nd Year, Spring Term"
            firstCourse.text="1. PhD Seminar"
            secondCourse.text="2. Additional Courses"
            thirdCourse.text="3. Research Assistantship"
            
           
        }
        
        //P2F
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==1 {
            
            result.text="PhD, 2nd Year, Fall Term"
            firstCourse.text="1. PhD Seminar"
            secondCourse.text="2. Additional Courses"
            thirdCourse.text="3. Preliminary Examination"
        }
        
        
    }
    
  
    
    
    @IBAction func calculate(sender: AnyObject) {
        writeResult()
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

