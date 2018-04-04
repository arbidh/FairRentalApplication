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


protocol CreateRentalViewControllerInput:CreateRentalPresenterOutput{
    
}

protocol CreateRentalViewControllerOutput{
    //func sortCarsBy(sortingType: SortingType)
    func fetchItems(request: FindACarRequest)
    func showgooglePredictions()
}

class CreateRentalViewController: UIViewController {
    // Present the Autocomplete view controller when the button is pressed.
    @IBOutlet weak var startReservationtextField: UITextField!
    public var output: CreateRentalViewControllerOutput!
    public var router: CreateRentalRouter!
    
    
    @IBAction func autocompleteClicked(_ sender: Any) {
      
         output.showgooglePredictions()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CreateRentalConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
    }
}
        


extension CreateRentalViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        autocompleteClicked(textField)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
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
       
    }


}


