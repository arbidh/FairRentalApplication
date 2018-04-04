//
//  LocateCarPresenter.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/29/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation


// MARK: - CreateRentalPresenterInput

/// _CreateRentalPresenterInput_ is a protocol for presenter input behaviours
protocol CreateRentalPresenterInput:CreateRentalInteractorOutput{
    func presentfetchedResults(response:FindACarResponse)
}
// MARK: - CreateRentalPresenterOutput

/// _CreateRentalPresenterOutput_ is a protocol for presenter output behaviours
protocol CreateRentalPresenterOutput:class{
    
    /// Called when Fetch from Worker is succeeded
    ///
    /// - parameter FindCarViewModel: FindCarViewModel
    func successFetchedItems(viewModel: FindACarViewModel)
    
    /// Calld when Fetch from Worker fails
    ///
    /// - parameter FindCarViewModel: FindCarViewModel
    func errorFetchingItems(viewModel: FindACarViewModel)
   
    /// Tells the output to display Cars
    ///
    /// - parameter FindCarViewModel: FindCarViewModel
    func displayCars(viewModels: [FindACarViewModel])
        
    /// Tells the output to dislpay an error
    ///
    /// - - parameter FindCarViewModel: FindCarViewModel
    func displayError(viewModel: ErrorViewModel)
    
    
    /// Tells the output to dislpay google predicted address list
    ///
    func showgooglePredictions()

}


// MARK: - CreatRentalPresenter

/// _CreateRentalPresenter_ is a class responsible for presenting car rental logic
class CreateRentalPresenter:CreateRentalPresenterInput{
    
     private(set) weak var output: CreateRentalPresenterOutput?
    // MARK: prenstation Logic

    
    // MARK: - Initializers
    
    /// Initializes a new instance of _CreateRentalPresnter_ with an output object
    ///
    /// - parameter output: The output that conforms to protocol _CreateRentalOutput_
    ///
    /// - returns: The instance of _CreateRentalPresenter_
    init(output: CreateRentalPresenterOutput) {
        self.output = output
    }
    
    
    /// displays google Adress predictions
    func displayGooglePredictions() {
        output?.showgooglePredictions()
    }

    /// Prepares the error model for presentation and tells the output to display fetchedItems
    ///
    /// - parameter response: The FindCarResponse
    func presentfetchedResults(response: FindACarResponse) {
        let viewModel = FindACarViewModel(fetchedResultData: response.results)
        if viewModel.fetchedResultData.count > 0{
            if let output = self.output {
                output.successFetchedItems(viewModel: viewModel)
            }
        }else{
            if let output = self.output {
                output.errorFetchingItems(viewModel: viewModel)
            }
        }
    }
}
