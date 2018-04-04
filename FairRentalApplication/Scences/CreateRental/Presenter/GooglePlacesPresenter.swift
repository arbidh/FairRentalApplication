//
//  GooglePlacesPresenter.swift
//  FairRentalApplication
//
//  Created by Arbi on 4/4/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import CoreLocation
import GooglePlaces

/// _ErrorPresenter_ is a protocol for presenting errors
protocol GooglePresenterProtocol{
    
    /// Present addresses given from GooglePlaces
    ///
    /// - parameter none
  func presentPredictions()
    
}

/// Extension of _ErrorPresenter_ protocol for common view controller error handling
extension GooglePresenterProtocol where Self: UIViewController{
    
    /// Presents an error for a view controller using an alert
    ///
    /// - parameter viewModel: The view model for the error
    func presentPredictions() {
      //   let autocompleteController = GMSAutocompleteViewController()
       // autocompleteController.delegate = self
        //present(autocompleteController, animated: true, completion: nil)
    }
    
}
extension CreateRentalViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
    }
    @IBAction func getCurrentLocation(){
        var placesClient = GMSPlacesClient.shared()
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            if let placeLikelihoodList = placeLikelihoodList {
                for likelihood in placeLikelihoodList.likelihoods {
                    let place = likelihood.place
                    print("Current Place name \(place.name) at likelihood \(likelihood.likelihood)")
                    print("Current Place address \(place.formattedAddress)")
                    print("Current Place attributions \(place.attributions)")
                    print("Current PlaceID \(place.placeID)")
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startReservationtextField.delegate = self
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        return true
    }
    
}
