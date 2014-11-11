//
//  seconddataViewController.swift
//  Atlas2
//
//  Created by Milee Shrestha on 11/10/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class seconddataViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var Result1: UITextField!
    @IBOutlet weak var courseText: UITextView!
    
       //var unit = data()
    
    func setResult1 (resultValue:Int) {
        Result1.text = String(resultValue)
    
    
    //M1S
    if programSegment.selectedSegmentIndex==0 && yearSegment.selectedSegmentIndex==0 && termSegment.selectedSegmentIndex==0 {
    Result1.text="Master's, 1st Year, Spring Term"
    
    //M1F
    if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
    Result1.text="Master's, 1st Year, Fall Term"
    "3. Technology Elective"
    }
    
    //M2S
    if programSegment.selectedSegmentIndex==0 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==0 {
    Result1.text="Master's, 1st Year, Fall Term"
    }
        
    //M2F
    if programSegment.selectedSegmentIndex==0 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==1 {
    Result1.text="Master's, 2nd Year, Spring Term"
    }
        
    //P1S
    if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==0 && termSegment.selectedSegmentIndex==0 {
    Result1.text="PhD, 1st Year, Spring Term"
        
    }
    //P1F
    if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==0 && termSegment.selectedSegmentIndex==1 {
    Result1.text="PhD, 1st Year, Fall Term"
    }
    
    //P2S
    if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==0 {
    Result1.text="PhD, 2nd Year, Spring Term"
    }
    
    //P2F
    if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==1 {
    Result1.text="PhD, 2nd Year, Fall Term"
    courseText.text="1. PhD Seminar"; "2. Preliminary Examination";
    " "
    }
        
        
    
    
}
    
    
    func setCourseText (resultValue:Int) {
        courseText.text = String(courseValue)
        
        
        
        //M1S
        if programSegment.selectedSegmentIndex==0 && yearSegment.selectedSegmentIndex==0 && termSegment.selectedSegmentIndex==0 {
            
            courseText.text="1. Fieldwork Methods";
            "2. Global Development II"; "3. Technology Elective"
        }
        //M1F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
            
            courseText.text="1. ICTD Case Studies"; "2. Global Development I";
            "3. Technology Elective"
        }
        
        //M2S
        if programSegment.selectedSegmentIndex==0 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==0 {
            
            courseText.text="Practicum"; " "; " "
        }
        //M2F
        if programSegment.selectedSegmentIndex==0 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==1 {
            
            courseText.text="1. ICTD Laboratory"; "2. Domain-specific elective"; "3. Technology Elective"
        }
        //P1S
        if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==0 && termSegment.selectedSegmentIndex==0 {
            
            courseText.text="1. PhD Seminar"; "2. Quantitative Analysis"; "3. Qualitative Analysis"
        }
        //P1F
        if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==0 && termSegment.selectedSegmentIndex==1 {
            
            courseText.text="1. PhD Seminar"; "2. Additional Courses"; "3. Teaching Assistantship"
        }
        
        //P2S
        if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==0 {
            
            courseText.text="1. PhD Seminar"; "2. Research Assistantship"; " "
        }
        
        //P2F
        if programSegment.selectedSegmentIndex==1 && yearSegment.selectedSegmentIndex==1 && termSegment.selectedSegmentIndex==1 {
            courseText.text="1. PhD Seminar"; "2. Preliminary Examination"; " "
        }
        
        
    
        

        

  //  init(coder aDecoder: NSCoder!)
   // {
    //    super.init(coder: aDecoder)
  //  }


      //  }




           // dataViewController.unit.firstCourse=courseOne.text
            //dataViewController.unit.secondCourse=courseTwo.text
            //dataViewController.unit.thirdCourse=courseThree.text




    override func viewDidLoad() {
        courseText.delegate=self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

        }
