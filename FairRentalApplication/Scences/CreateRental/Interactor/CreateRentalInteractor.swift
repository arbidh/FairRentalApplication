//
//  LocateCarInteractor.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/29/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation


// MARK: - CreateRentalInteractorInput

/// _CreateRentalInteractorInput_ is a protocol for interactor input behaviours
protocol CreateRentalInteractorInput:CreateRentalViewControllerOutput{
    // func findACar(request:FindACarRequest)
    func fetchItems(request: FindACarRequest)
}
/// _ArtistInteractorOutput_ is a protocol for interactor output behaviours
protocol CreateRentalInteractorOutput{
    // func showRespones(response:FindACarResponse)
    func presentfetchedResults(response: FindACarResponse)
    
    /// Tells the output to present google predictions
    ///
    /// - parameter none
    func displayGooglePredictions()
}


//Contains the Business Logic
// MARK: - CreatRentalInteractor

/// _CreateRentalInteractor_ is an interactor responsible for artist details business logic
class CreateRentalInteractor:CreateRentalInteractorInput{
    
    //displays google predictions
    //
    /// - parameter none
    func showgooglePredictions() {
        output.displayGooglePredictions()
    }
    
    
    var output:CreateRentalInteractorOutput!
    var worker:FindACarWorker!
    var locationManager:LocationManager?
    
    // MARK: - Initializers
    
    /// Initializes an instance of _CreateRentalInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactors output
    /// - parameter worker: The FindACar worker used to fetch car rentals
    ///
    /// - returns: An instance of _CreateRentalInteractor_
    init(output: CreateRentalInteractorOutput, worker: FindACarWorker = FindACarWorker()) {
        self.output = output
        self.worker = worker
    }
    
    
    // MARK: - Business logic
    
    /// Fetches a list of Cars for Rent
    ///
    /// - parameter findACarRequest : Model for Car request data
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
   
}
