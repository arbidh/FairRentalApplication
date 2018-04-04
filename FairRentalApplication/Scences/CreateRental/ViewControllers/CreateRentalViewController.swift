//
//  LocateACarViewController.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/29/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation
import GooglePlaces

// MARK: - CreateRentalViewControlelrInput

/// _CreateViewControllerInput_ is a protocol for view controller input behaviours
protocol CreateRentalViewControllerInput:CreateRentalPresenterOutput{
    
}

// MARK: - CreateRentalViewControllerOutput

/// _CreateViewControllerOutput is a protocol for view controller output behaviours
protocol CreateRentalViewControllerOutput{
    
    /// Tells the output (interactor) to fetch cars for rentals
    ///
    /// - parameter artistId: The artist identifier
    func fetchItems(request: FindACarRequest)
    
    /// Tells the output (interactor) to get the location info from google autocomplete
    ///
    /// - parameter artistId: The artist identifier
    func showgooglePredictions()
}


// MARK: - CreateRentalViewController

/// _CreateRentalViewController_ is a view controller responsible for displaying list of car rentals
class CreateRentalViewController: UIViewController, GooglePresenterProtocol {
    
    // Present the Autocomplete view controller when the button is pressed.
    @IBOutlet weak var startReservationtextField: UITextField!
    public var output: CreateRentalViewControllerOutput!
    public var router: CreateRentalRouter!
    
    // MARK: - IBAction GoogleAutoComplete
    
    /// Calls _autocompletClicked
    ///
    /// - parameter any:       Any
    @IBAction func autocompleteClicked(_ sender: Any) {
         output.showgooglePredictions()
    }
    
    override func viewDidLoad() {
        startReservationtextField.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CreateRentalConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
    }
}
        
// MARK: - UITextFieldDelegate

/// _CreateViewControllerOutput is a protocol for view controller output behaviours

extension CreateRentalViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        autocompleteClicked(textField)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
// MARK: - CreateRentalPresenterOutput

extension CreateRentalViewController: CreateRentalViewControllerInput{
    
    
    func successFetchedItems(viewModel: FindACarViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: FindACarViewModel) {
        
    }
    
    func displayCars(viewModels: [FindACarViewModel]) {
        
    }
    
    func displayError(viewModel: ErrorViewModel) {
        
    }
    
    func showgooglePredictions() {
       self.presentPredictions()
    }

}


