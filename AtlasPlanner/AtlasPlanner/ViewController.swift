//
//  ViewController.swift
//  AtlasPlanner
//
//  Created by Milee Shrestha on 10/3/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var atlasBuilding: UIImageView!
    @IBOutlet weak var programLabel: UILabel!
    
    @IBOutlet weak var masterView: UILabel!
    @IBOutlet weak var PhDView: UILabel!
    
    @IBOutlet weak var yearView: UILabel!
    @IBOutlet weak var firstYear: UILabel!
    @IBOutlet weak var secondYear: UILabel!
    
    @IBOutlet weak var termView: UILabel!
    @IBOutlet weak var springTerm: UILabel!
    @IBOutlet weak var fallTerm: UILabel!
    
    //Define the switches for the program, year and term
    
    
    @IBOutlet weak var ProgramSegment: UISegmentedControl!
    
    @IBOutlet weak var YearSegment: UISegmentedControl!
    
    @IBOutlet weak var TermSegment: UISegmentedControl!
    @IBOutlet weak var Result1: UILabel!
    @IBOutlet weak var Course1Text: UILabel!
    @IBOutlet weak var Course2Text: UILabel!
    @IBOutlet weak var Course3Text: UILabel!
    func writeResult() {
        //M1S
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==0 {
                Result1.text="Master's, 1st Year, Spring Term"
                Course1Text.text="1. Fieldwork Methods"
                Course2Text.text="2. Global Development II"
                Course3Text.text="3. Technology Elective"
        }
        //M1F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
            Result1.text="Master's, 1st Year, Fall Term"
            Course1Text.text="1. ICTD Case Studies"
            Course2Text.text="2. Global Development I"
            Course3Text.text="3. Technology Elective"
        }
        
        //M2S
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==0 {
            Result1.text="Master's, 2nd Year, Fall Term"
            Course1Text.text="Practicum"
            Course2Text.text=" "
            Course3Text.text=" "
        }
        //M2F
        if ProgramSegment.selectedSegmentIndex==0 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==1 {
            Result1.text="Master's, 2nd Year, Spring Term"
            Course1Text.text="1. ICTD Laboratory"
            Course2Text.text="2. Domain-specific elective"
            Course3Text.text="3. Technology Elective"
        }
        //P1S
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==0 {
            Result1.text="PhD, 1st Year, Spring Term"
            Course1Text.text="1. PhD Seminar"
            Course2Text.text="2. Quantitative Analysis"
            Course3Text.text="3. Qualitative Analysis"
        }
        //P1F
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==0 && TermSegment.selectedSegmentIndex==1 {
            Result1.text="PhD, 1st Year, Fall Term"
            Course1Text.text="1. PhD Seminar"
            Course2Text.text="2. Additional Courses"
            Course3Text.text="3. Teaching Assistantship"
        }
        
        //P2S
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==0 {
            Result1.text="PhD, 2nd Year, Spring Term"
            Course1Text.text="1. PhD Seminar"
            Course2Text.text="2. Research Assistantship"
            Course3Text.text=" "
        }
        
        //P2F
        if ProgramSegment.selectedSegmentIndex==1 && YearSegment.selectedSegmentIndex==1 && TermSegment.selectedSegmentIndex==1 {
            Result1.text="PhD, 2nd Year, Fall Term"
            Course1Text.text="1. PhD Seminar"
            Course2Text.text="2. Preliminary Examination"
            Course3Text.text=" "
        }
        
        
    }

    
    //
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

