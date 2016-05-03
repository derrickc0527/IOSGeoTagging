//
//  ViewController.swift
//  IOSGeoTargetting
//
//  Created by Derrick Chong on 5/3/16.
//  Copyright © 2016 DerrickCorp. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /**
         set location manager
         */
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        /**
         set mkview
         */
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .Follow
        
        setupData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if CLLocationManager.authorizationStatus() == .NotDetermined{
            locationManager.requestAlwaysAuthorization()
        }
        else if CLLocationManager.authorizationStatus() == .Denied{
            showAlert("Please enable location service on your device.")
        }
        else if CLLocationManager.authorizationStatus() == .AuthorizedAlways{
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupData(){
        if CLLocationManager.isMonitoringAvailableForClass(CLCircularRegion.self){
            let title = "Location: "
            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
            let regionRadiu = 300.0
                    }
    }


}

