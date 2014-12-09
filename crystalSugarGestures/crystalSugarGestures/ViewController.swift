//
//  ViewController.swift
//  crystalSugarGestures
//
//  Created by Milee Shrestha on 12/9/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        
        
        
        let translation = sender.translationInView(view) //returns the new location
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPointZero, inView: view)  //set the translation back to 0
        
        
        
        if sender.state == UIGestureRecognizerState.Ended {
            
            //figure out the velocity
            
            let velocity = sender.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            
            
            let slideFactor = 0.1 * slideMultiplier
            
            var finalPoint = CGPoint(x: sender.view!.center.x +  (velocity.x * slideFactor), y: sender.view!.center.y + (velocity.y * slideFactor))
            
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            
            
            UIView.animateWithDuration(Double(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {sender.view!.center = finalPoint }, completion: nil)
            
            
        }
        
        
        
    }
    @IBAction func handleRotate(sender: UIRotationGestureRecognizer) {
        
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale=1
        
        
    }
    
    
     func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
        
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

