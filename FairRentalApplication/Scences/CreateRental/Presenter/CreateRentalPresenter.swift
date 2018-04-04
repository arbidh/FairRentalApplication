//
//  LocateCarPresenter.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/29/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
protocol CreateRentalPresenterInput:CreateRentalInteractorOutput{
    func presentfetchedResults(response:FindACarResponse)
}
// MARK: - ArtistsPresenterOutput

/// _ArtistsPresenterOutput_ is a protocol for presenter output behaviours
protocol CreateRentalPresenterOutput:class{
    func successFetchedItems(viewModel: FindACarViewModel)
    func errorFetchingItems(viewModel: FindACarViewModel)
   

        
        /// Tells the output to display artists
        ///
        /// - parameter viewModels: The artist view models
        func displayCars(viewModels: [FindACarViewModel])
        
        /// Tells the output to dislpay an error
        ///
        /// - parameter viewModel: The error view model
        func displayError(viewModel: ErrorViewModel)
    
    func showgooglePredictions()

}

class CreateRentalPresenter:CreateRentalPresenterInput{
    
     private(set) weak var output: CreateRentalPresenterOutput?
    // MARK: prenstation Logic

    init(output: CreateRentalPresenterOutput) {
        self.output = output
    }
    
    
    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - parameter error: The error
    func displayGooglePredictions() {
        output?.showgooglePredictions()
    }

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
