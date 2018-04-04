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

 /// Extension of _GooglePresenter protocol for handling callbacks from google place services.
extension GooglePresenterProtocol where Self: CreateRentalViewController{
    
    /// Presents a google view controller listing Addresses
    ///
    /// - parameter none
    func presentPredictions() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
}

/// Extension of _CreateRentalViewController_ for handling GMSAutoCompleteViewControllerDelegate

extension CreateRentalViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
    }
    
    /// get Current location with Google places
    ///
    /// - parameter none
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
            
                    print("Current PlaceID \(place.placeID)")
                }
            }
        })
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
