//
//  ViewController.swift
//  Maps
//
//  Created by Tedi Konda on 3/18/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AddressBookUI

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let locmanager = CLLocationManager()
    let searchRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map.mapType = MKMapType.Standard
        let initialLocation = CLLocation(latitude: 38.878, longitude: -77.0342)
        centerMapOnLocation(initialLocation)

        self.map.delegate = self
        
        self.locmanager.delegate = self
        self.locmanager.desiredAccuracy = kCLLocationAccuracyBest
        self.locmanager.activityType = .Fitness
        self.locmanager.startUpdatingLocation()
    }
    
    func determineLocationStatus()-> Bool {
        let isOkay = CLLocationManager.locationServicesEnabled()
        if !isOkay {
            return true
        }
        
        let status = CLLocationManager.authorizationStatus()
        switch status{
        case CLAuthorizationStatus.AuthorizedAlways, CLAuthorizationStatus.AuthorizedWhenInUse:
            return true
        case .NotDetermined:
            self.locmanager.requestWhenInUseAuthorization()
            return true
        case .Restricted:
            return false
        case .Denied:
            return false
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("updated location")
        let loc = locations.last as CLLocation
        let coordinate = loc.coordinate
        println(loc)
        println("you are currently at \(coordinate.latitude) and \(coordinate.longitude)")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.searchRadius, self.searchRadius)
        self.map.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func showCurrentLoction(sender: UIButton) {
        self.locmanager.requestWhenInUseAuthorization()
        self.map.userTrackingMode = MKUserTrackingMode.Follow
    }
    
    
    @IBAction func geocodeAddress(sender: UIButton) {
        let loc = self.map.userLocation.location
        if loc == nil {
            println("I don't know where you are, yo")
            return
        }
        let geocode = CLGeocoder()
        geocode.reverseGeocodeLocation(loc, completionHandler: {
            (placemarks: [AnyObject]!, error: NSError!) -> Void in
            if placemarks != nil {
                let placemark = placemarks[0] as CLPlacemark
                let address = ABCreateStringWithAddressDictionary(placemark.addressDictionary, false)
                
                println("You are at:\n\(address)")
            }
        })
    }
    
    
    @IBAction func findFood(sender: UIButton) {
        if !determineLocationStatus() {
            println("Sorry, can't give you food because you didn't give me location")
            return
        }
        
        let userLoc = self.map.userLocation
        let loc = userLoc.location
        
        if loc == nil {
            println("I don't know where you are")
            return
        }
        
        let searchReq = MKLocalSearchRequest()
        searchReq.naturalLanguageQuery = "pizza"
        searchReq.region = self.map.region
        let search = MKLocalSearch(request: searchReq)
        
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil {
                println(error)
                return
            }
            
            self.map.showsUserLocation = false
            //feeling lucky
            let searchResultsMarker = response.mapItems[0] as MKMapItem
            let place = searchResultsMarker.placemark
            let loc = place.location.coordinate
            let region = MKCoordinateRegionMakeWithDistance(loc, 1200, 1200)
            
            self.map.setRegion(region, animated: true)
//            let pizzaEna = MKPointAnnotation()
//            pizzaEna.title = searchResultsMarker.name
//            pizzaEna.subtitle = searchResultsMarker.phoneNumber
//            pizzaEna.coordinate = loc
            
            let restaurant = Restaurant(title: searchResultsMarker.name, locationName: searchResultsMarker.phoneNumber, coordinate: loc)
            
            self.map.addAnnotation(restaurant)
//            println(restaurant)
        }
        
    }
    
    
    @IBAction func getDirectionsToFood(sender: UIButton) {

    }
    
    
    @IBAction func showLocationInMapsApp(sender: UIButton) {
     let mapItem = MKMapItem.mapItemForCurrentLocation()
        
        mapItem.openInMapsWithLaunchOptions([MKLaunchOptionsMapTypeKey:MKMapType.Standard.rawValue])
        
    }
    



}

