//
//  FindACarRouter.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import UIKit

protocol FindACarRouterInput{
    func navigate()
}


class FindACarRouter{
    weak var viewController:FindACarViewController?
    // MARK: Communication
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == "ShowSomewhereScene" {
            passDataToSomewhereScene(segue: segue)
        }
    }
    func navigate(){
        
    }
    
    func passDataToSomewhereScene(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router how to pass data to the next scene
        
        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
        // someWhereViewController.output.name = viewController.output.name
    }
    
}

// MARK: - FindACarRouterProtocol

extension FindACarRouter: FindACarRouterInput {
    
    /// Handles the navigation when selecting an artist in the list to car Rental detail
    ///
    /// - parameter indexPath: The selected index path
    func navigateToFindACarVC() {
        

    }
}



