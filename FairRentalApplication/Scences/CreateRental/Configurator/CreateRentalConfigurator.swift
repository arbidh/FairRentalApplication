//
//  LocateCarConfigurator.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/30/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import Foundation
import UIKit



final class CreateRentalConfigurator{
    
    static var sharedInstance:CreateRentalConfigurator = CreateRentalConfigurator()
    
    
    // MARK: - Configuration
    
    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController:CreateRentalViewController){
        let router = CreateRentalRouter(viewController: viewController)

        let locationManager = LocationManager()
        locationManager.manager?.requestWhenInUseAuthorization()
        let presenter = CreateRentalPresenter(output: viewController)    

        let interactor = CreateRentalInteractor(output: presenter)
        interactor.output = presenter
        interactor.locationManager = locationManager

        viewController.output = interactor
        viewController.router = router
        
    }
    
}
