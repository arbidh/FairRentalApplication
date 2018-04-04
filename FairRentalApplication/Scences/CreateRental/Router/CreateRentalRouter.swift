//
//  LocateACarRouter.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/30/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CreateRentalProtocol

/// _CreateRentalProtocol_ is a protocol for router input behaviours
protocol CreateRentalRouterInput{
    func navigate()
}



class CreateRentalRouter{
    weak var viewController:CreateRentalViewController?
   
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _CreateRentalRouter_
    ///
    /// - parameter viewController: The _CreateRentalViewController_ to route from
    ///
    /// - returns: The instance of _CreateRentalRouter_
    init(viewController:CreateRentalViewController) {
        self.viewController = viewController
    }
    
    
    // MARK: Communication
   
    /// passes data to the given viewController
    /// -parameter : UIStoryboardSegue
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        if segue.identifier == "CreateRentalSegue" {
            passDataToFindCarVC(segue: segue)
        }
    }
    
    /// navigates the given viewController
    func navigate(){
         //Trigger a storyboard segue
        viewController?.performSegue(withIdentifier: "CreateRentalSeguge", sender:  nil)
    }
    
    /// navigates the FindACarViewController
    /// parameter segue: UIStoryBoardSegue
    func passDataToFindCarVC(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router how to pass data to the next scene
        let findCarViewController = segue.destination as? FindACarViewController
        findCarViewController?.output.locationInfo = [0.0,0.0]
    }
    
}
