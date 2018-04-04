//
//  LocateCarWorker.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/30/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation



class CreateRentalWorker{
    // MARK: Biz Logic
    func fetch(RequestData:FindACarRequest , success:@escaping(responseHandler), fail:@escaping(responseHandler)){
        
        var request = FindACarRequest()
        request.latitude = 35.1504
        request.longitude = -114.57632
        request.radius = 42
        request.drop_off = "2018-06-08"
        request.pick_up = "2018-06-07"
        apiHandler.createARequestWithURL(requestData: request,
                                         success: { (response,apiResponse) in
                                            success(response,apiResponse)
                                            
        }) {(errorReponse,apiResponse) in
            fail(nil,apiResponse)
        }
    }
    
}
