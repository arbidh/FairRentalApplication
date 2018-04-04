//
//  FindACarPresenter.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation

protocol FindACarPresenterInput{
    func presentfetchedResults(response:FindACarResponse)
}
protocol FindACarPresenterOutput:class{
    func successFetchedItems(viewModel: FindACarViewModel)
    func errorFetchingItems(viewModel: FindACarViewModel)
    /// Tells the output to dislpay an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}

class FindACarPresenter:FindACarPresenterInput{
   
    weak var output:FindACarPresenterOutput!
    // MARK: prenstation Logic
    
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
    
    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - parameter error: The error
    func presentError(error: Error) {
        
        let errorViewModel = ErrorViewModel(title: LocalizedStrings.Error.genericTitle,
                                            message: LocalizedStrings.Error.genericMessage,
                                            buttonTitles: [LocalizedStrings.Error.okButtonTitle])
        
        
        output?.displayError(viewModel: errorViewModel)
    }
    
   
}
