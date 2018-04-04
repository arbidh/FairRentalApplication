//
//  FindACarInteractor.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation

// MARK: - ArtistInteractorInput

/// _ArtistInteractorInput_ is a protocol for interactor input behaviours
protocol FindACarInteractorInput{
   // func findACar(request:FindACarRequest)
     func fetchItems(request: FindACarRequest)
}

// MARK: - ArtistInteractorOutput

/// _ArtistInteractorOutput_ is a protocol for interactor output behaviours
protocol FindACarInteractorOutput{
   // func showRespones(response:FindACarResponse)
    func presentfetchedResults(response: FindACarResponse)
    
    /// Tells the output to present albums
    ///
    /// - parameter albums: The list of albums to present
    func presentCars(albums: [Cars])
    
    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}


//Contains the Business Logic
class FindACarInteractor:FindACarInteractorInput{
    
    var output:FindACarInteractorOutput!
    var worker:FindACarWorker!
    var locationManager:LocationManager?
    
    
    func fetchItems(request: FindACarRequest) {
    
        worker = FindACarWorker()
        
        var request = FindACarRequest()
        request.latitude = locationManager?.latitude
        request.longitude = locationManager?.longitude
        request.radius = 42
        request.drop_off = "2018-06-08"
        request.pick_up = "2018-06-07"
        worker.fetch(RequestData: request, success:
            { response, apiResponse in
                if let fetchResponse = response{
                    self.output.presentfetchedResults(response: fetchResponse)
                
                }
        }) { (response, apiResponse) in
            if let fetchResponse = response{
                 self.output.presentfetchedResults(response: fetchResponse)
            }
        }
    }
    
    
 
    // MARK: Business Logic
    
   
    
}
