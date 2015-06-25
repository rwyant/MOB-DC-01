//
//  ViewController.swift
//  Maps
//
//  Created by Tedi Konda on 3/18/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import MapKit
import AddressBookUI
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    let locman = CLLocationManager()
    let searchRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.mapType = MKMapType.Hybrid
        
        let initialLocation = CLLocation(latitude: 38.9059246844043, longitude: -77.0405378379645)
        centerMapOnLocation(initialLocation)
        
        self.map.delegate = self
        
        self.locman.delegate = self
        self.locman.desiredAccuracy = kCLLocationAccuracyBest
        self.locman.activityType = .Fitness
        self.locman.startUpdatingLocation()
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            searchRadius * 2.0, searchRadius * 2.0)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func determineStatus() -> Bool {
        let ok = CLLocationManager.locationServicesEnabled()
        if !ok {
            return true // ! this is so that we try to use it anyway...
            // system will put up a dialog suggesting the user turn on Location Services
        }
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case CLAuthorizationStatus.AuthorizedAlways, .AuthorizedWhenInUse:
            return true
        case .NotDetermined:
            self.locman.requestWhenInUseAuthorization()
            // locman.requestAlwaysAuthorization()
            return true // NB, this is different from strategy in previous chapters
        case .Restricted:
            return false
        case .Denied:
            // new iOS 8 feature: sane way of getting the user directly to the relevant prefs
            // I think the crash-in-background issue is now gone
            let alert = UIAlertController(title: "Need Authorization", message: "Wouldn't you like to authorize this app to use Location Services?", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
                _ in
                let url = NSURL(string:UIApplicationOpenSettingsURLString)!
                UIApplication.sharedApplication().openURL(url)
            }))
            self.presentViewController(alert, animated:true, completion:nil)
            return false
        }
    }
    
    func stopTrying () {
        self.locman.stopUpdatingLocation()
    }
    
    
    func centerMapOnMyLoc() {
        let searchRadius: CLLocationDistance = 1000
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("failed: \(error)")
        self.stopTrying()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        print("did update location ")
        let loc = locations.last as! CLLocation
        let acc = loc.horizontalAccuracy
        let time = loc.timestamp
        let coord = loc.coordinate
        println(acc)
        
        println("You are at \(coord.latitude) \(coord.longitude)")
        // self.stopTrying()
    }

    @IBAction func showCurrentLoction(sender: UIButton) {
        // new in iOS 8, can't simply switch this on
        // must request authorization first
        // and this request will be ignored without a corresponding reason in the Info.plist
        // (see next chapter for full dance)
        self.locman.requestWhenInUseAuthorization()
        // self.map.showsUserLocation = true // otiose (I love that word)
        self.map.userTrackingMode = .Follow // will cause map to zoom nicely to user location
        // (the thing I was doing before, adjusting the map region manually, was just wrong)
    }
    
    
    @IBAction func geocodeAddress(sender: UIButton) {
        let loc = self.map.userLocation.location
        if loc == nil {
            println("I don't know where you are now")
            return
        }
        let geo = CLGeocoder()
        geo.reverseGeocodeLocation(loc) {
            (placemarks : [AnyObject]!, error : NSError!) in
            if placemarks != nil {
                let p = placemarks[0] as! CLPlacemark
                let s = ABCreateStringWithAddressDictionary(p.addressDictionary, false)
                println("you are at:\n\(s)") // do something with address
            }
        }
    }
    
    
    @IBAction func findFood(sender: UIButton) {
        if !self.determineStatus() {
            println("not authorized")
            return
        }
        
        let userLoc = self.map.userLocation
        let loc = userLoc.location
        if loc == nil {
            println("I don't know where you are now")
            return
        }
        let req = MKLocalSearchRequest()
        req.naturalLanguageQuery = "pizza"
        req.region = self.map.region
        let search = MKLocalSearch(request:req)
        search.startWithCompletionHandler() {
            (response : MKLocalSearchResponse!, error : NSError!) in
            if response == nil {
                println(error)
                return
            }
            self.map.showsUserLocation = false
            let mi = response.mapItems[0] as! MKMapItem // I'm feeling lucky
            let place = mi.placemark
            let loc = place.location.coordinate
            let reg = MKCoordinateRegionMakeWithDistance(loc, 1200, 1200)
            self.map.setRegion(reg, animated:true)
            let pizzaPlace1 = MKPointAnnotation()
            pizzaPlace1.title = mi.name
            pizzaPlace1.subtitle = mi.phoneNumber
            pizzaPlace1.coordinate = loc
            
            self.map.addAnnotation(pizzaPlace1)
            
            // another way of adding pizza pin
            let pizzaPlace2 = Pizza(title: "Mario's pizza",
                locationName: "Clarendon",
                coordinate: (response.mapItems[1] as! MKMapItem).placemark.location.coordinate)
            
            self.map.addAnnotation(pizzaPlace2)
        }
    }
    
    
    @IBAction func getDirectionsToFood(sender: UIButton) {
        let userLoc = self.map.userLocation
        let loc = userLoc.location
        if loc == nil {
            println("I don't know where you are now")
            return
        }
        let req = MKLocalSearchRequest()
        req.naturalLanguageQuery = "pizza"
        req.region = self.map.region
        let search = MKLocalSearch(request:req)
        search.startWithCompletionHandler() {
            (response : MKLocalSearchResponse!, error : NSError!) in
            if response == nil {
                println(error)
                return
            }
            println("Got restaurant address")
            let mi = response.mapItems[0] as! MKMapItem // I'm still feeling lucky
            let req = MKDirectionsRequest()
            req.setSource(MKMapItem.mapItemForCurrentLocation())
            req.setDestination(mi)
            let dir = MKDirections(request:req)
            dir.calculateDirectionsWithCompletionHandler() {
                (response:MKDirectionsResponse!, error:NSError!) in
                if response == nil {
                    println(error)
                    return
                }
                println("got directions")
                let route = response.routes[0] as! MKRoute // I'm feeling insanely lucky
                let poly = route.polyline
                self.map.addOverlay(poly)
                for step in route.steps {
                    println("After \(step.distance) metres: \(step.instructions)")
                }
            }
        }
    }
    
    
    @IBAction func showLocationInMapsApp(sender: UIButton) {
        let mi = MKMapItem.mapItemForCurrentLocation()
        // setting the span doesn't seem to work
        //let span = MKCoordinateSpanMake(0.0005, 0.0005)
        mi.openInMapsWithLaunchOptions([
            MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue,
            //MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan:span)
        ])
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        var v : MKPolylineRenderer! = nil
        if let overlay = overlay as? MKPolyline {
            v = MKPolylineRenderer(polyline:overlay)
            v.strokeColor = UIColor.blueColor().colorWithAlphaComponent(0.8)
            v.lineWidth = 2
        }
        return v
    }


}

