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
    
    @IBOutlet weak var courseView: UITextView!
    
   
    @IBAction func courseDescription(sender: AnyObject) {
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==0 {
            courseView.text="Master's, 1st Year, Spring Term"; "1. Fieldwork Methods"; "2. Global Development II"; "3. Technology Elective"
        }
        //M1F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
            courseView.text="Master's, 1st Year, Fall Term"; "1. ICTD Case Studies"; "2. Global Development I"; "3. Technology Elective"
        }
        
        //M2S
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==0 {
            courseView.text="Master's, 1st Year, Fall Term"; "Practicum"; " "; " "
        }
        //M2F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==1 {
            courseView.text="Master's, 2nd Year, Spring Term"; "1. ICTD Laboratory"; "2. Domain-specific elective"; "3. Technology Elective"
        }
        //P1S
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==0 {
           courseView.text="PhD, 1st Year, Spring Term"; "1. PhD Seminar"; "2. Quantitative Analysis"; "3. Qualitative Analysis"
        }
        //P1F
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
           courseView.text="PhD, 1st Year, Fall Term"; "1. PhD Seminar"; "2. Additional Courses"; "3. Teaching Assistantship"
        }
        
        //P2S
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==0 {
           courseView.text="1. PhD Seminar"; "2. Research Assistantship"; " "
        }
        
        //P2F
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==1 {
           courseView.text="PhD, 2nd Year, Fall Term"
           "1. PhD Seminar"; "2. Preliminary Examination"; " "
        }
        
        
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

