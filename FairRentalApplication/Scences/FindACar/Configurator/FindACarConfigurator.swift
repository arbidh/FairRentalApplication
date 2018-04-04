//
//  FindACarConfigurator.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation
import UIKit

// MARK: Connect View, Interactor, and Presenter

extension FindACarViewController:FindACarPresenterOutput{

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}
extension FindACarInteractor: FindACarViewControllerOutput{
    var locationInfo: [Double] {
        get {
            return [0.0,0.0]
        }
        set {
            
            if let latitutde = locationManager?.latitude, let longitude =
                locationManager?.longitude{
                locationInfo = [latitutde,longitude]
            }
        }
    }
    
  
    
    func sortCarsBy(sortingType: SortingType) {
        
    }
    
    
}
extension FindACarPresenter:FindACarInteractorOutput{
    func presentCars(albums: [Cars]) {
        
    }
    
    func showRespones(response: FindACarResponse) {
        
    }
    
    
}

final public class FindACarConfigurator{
    
    static var sharedInstance:FindACarConfigurator = FindACarConfigurator()
    let locationManager = LocationManager()
    
    func configure(viewController:FindACarViewController){
        let router = FindACarRouter()
        router.viewController = viewController
        
        locationManager.manager?.requestWhenInUseAuthorization()
        let presenter = FindACarPresenter()
        presenter.output = viewController
        
        let interactor = FindACarInteractor()
        interactor.output = presenter
        interactor.locationManager = locationManager
        
        viewController.output = interactor
        viewController.router = router
       
    }
    
}




