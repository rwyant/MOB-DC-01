//
//  Artwork.swift
//  Maps
//
//  Created by Tedi Konda on 3/18/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import MapKit

class Restaurant: NSObject, MKAnnotation {
    let title: String
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String {
        return locationName
    }
}