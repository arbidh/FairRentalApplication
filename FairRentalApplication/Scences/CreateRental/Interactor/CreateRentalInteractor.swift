//
//  LocateCarInteractor.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/29/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
protocol CreateRentalInteractorInput:CreateRentalViewControllerOutput{
    // func findACar(request:FindACarRequest)
    func fetchItems(request: FindACarRequest)
}
/// _ArtistInteractorOutput_ is a protocol for interactor output behaviours
protocol CreateRentalInteractorOutput{
    // func showRespones(response:FindACarResponse)
    func presentfetchedResults(response: FindACarResponse)
    
    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func displayGooglePredictions()
}


//Contains the Business Logic
class CreateRentalInteractor:CreateRentalInteractorInput{
    func showgooglePredictions() {
        
    }
    
    
    var output:CreateRentalInteractorOutput!
    var worker:FindACarWorker!
    var locationManager:LocationManager?
    
    init(output: CreateRentalInteractorOutput, worker: FindACarWorker = FindACarWorker()) {
        self.output = output
        self.worker = worker
    }
    
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
