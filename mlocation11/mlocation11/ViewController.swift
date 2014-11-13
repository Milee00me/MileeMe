//
//  ViewController.swift
//  mlocation11
//
//  Created by Milee Shrestha on 11/13/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        
       // let location = CLLocationCoordinate2D(latitude: 40.74836, longitude: -73.98460)
        
       // let span = MKCoordinateSpanMake(0.05, 0.05) // defines the area spanned by a map region
       // let region = MKCoordinateRegion(center: location, span: span) // region of the map to be displayed
        
        //mapView.setRegion(region, animated: true) //animates changing the currently visible region
        
       // let annotation = MKPointAnnotation() //create an annotation
       // annotation.setCoordinate(location) //sets the coordinates of the annotation
        
      //  annotation.title="Empire state building" //sets the title of the annotation
        
       // annotation.subtitle="New York"
        
       // mapView.addAnnotation(annotation)
        
        
        
        mapView.mapType=MKMapType.Hybrid //hybrid with map and satellite
        
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
          
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization() //ios8 and later only
        }
        
        locationManager.delegate=self
        
        locationManager.desiredAccuracy=kCLLocationAccuracyBest //specify the desired accuracy
        
        locationManager.distanceFilter=kCLDistanceFilterNone //distance in meters
        
        mapView.showsUserLocation=true
        
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        let region = MKCoordinateRegionMake(manager.location.coordinate, span)
        
        mapView.setRegion(region, animated: true)
        
        annotation.coordinate=manager.location.coordinate
        annotation.title="You are here"
        annotation.subtitle="Latitude: \(manager.location.coordinate.latitude), Longitude: \(manager.location.coordinate.longitude)"
        
        mapView.addAnnotation(annotation)
    }
    
    
     func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
           locationManager.startUpdatingLocation()
        }
    }
    
    
    
     func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        
        var errorTypes=String()
        
        if let clError=CLError(rawValue: error.code) {
            if clError == .Denied {
                errorTypes="access denied"
                
                let alert=UIAlertController(title: "Error", message: errorTypes, preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction:UIAlertAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

