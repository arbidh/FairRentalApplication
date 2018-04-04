//
//  LocationManager.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import CoreLocation
class LocationManager:NSObject,CLLocationManagerDelegate{
    
    var longitude:Double?
    var latitude:Double?
    var manager:CLLocationManager?
    override init() {
         super.init()
        manager = CLLocationManager()
        if let manager = manager{
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(loc.latitude) \(loc.longitude)")
        latitude = loc.latitude
        longitude = loc.longitude
        print(longitude ?? "arbi")
        print(latitude ?? "arbi")
        
    }
    
}
