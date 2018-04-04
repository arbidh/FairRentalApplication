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

// MARK: - ArtistsRouterProtocol

extension FindACarRouter: FindACarRouterInput {
    
    /// Handles the navigation when selecting an artist in the list to artist detail
    ///
    /// - parameter indexPath: The selected index path
    func navigateToArtist(atIndexPath indexPath: IndexPath) {
        
//        if let artists = viewController?.output.artists, indexPath.row < artists.count {
//            
//            let selectedArtist = artists[indexPath.row]
//            
//            let artistViewController = ArtistViewController(artist: selectedArtist)
//            viewController?.navigationController?.pushViewController(artistViewController, animated: true)
//        }
    }
}



