//
//  LocateACarRouter.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/30/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import UIKit
protocol CreateRentalRouterInput{
    func navigate()
}


class CreateRentalRouter{
    weak var viewController:CreateRentalViewController?
   
    init(viewController:CreateRentalViewController) {
        self.viewController = viewController
    }
    
    
    // MARK: Communication
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        if segue.identifier == "CreateRentalSegue" {
            passDataToFindCarVC(segue: segue)
        }
    }
    
    func navigateToGoogleViewController(){
        
    }
    
    func navigate(){
         //Trigger a storyboard segue
        viewController?.performSegue(withIdentifier: "CreateRentalSeguge", sender:  nil)
    }
    
    func passDataToFindCarVC(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router how to pass data to the next scene
        let findCarViewController = segue.destination as? FindACarViewController
        findCarViewController?.output.locationInfo = [0.0,0.0]
    }
    
}
