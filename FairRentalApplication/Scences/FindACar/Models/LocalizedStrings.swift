//
//  LocalizedStrings.swift
//  FairRentalApplication
//
//  Created by Arbi on 4/4/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation

struct LocalizedStrings {
    
    struct Artists {
        
        static let screenTitle = NSLocalizedString("Top Artists", comment: "Top Artists screen title")
    }
    
    struct Artist {
        
        static let screenTitle = NSLocalizedString("Artist", comment: "Artist screen title")
        static let albumsTitle = NSLocalizedString("Top Albums", comment: "Artist header title")
    }
    
    struct Error {
        
        static let genericTitle = NSLocalizedString("Sorry", comment: "Generic error title")
        static let genericMessage = NSLocalizedString("Something went wrong.", comment: "Generic error message")
        static let okButtonTitle = NSLocalizedString("Ok", comment: "Alert button title")
    }
}
