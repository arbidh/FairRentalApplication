          //
//  APIHandler.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/11/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation

/// FairRentalError is an enumeration for Rental Car errors
///
/// - generic:         Generic error
/// - invalidURL:      Invalid URL error
/// - invalidResponse: Invalid response
enum FairRentalError: Error {
    case generic
    case invalidURL
    case invalidResponse
}
          
let  apiKey = "e2MHOSyDV9TJWoDT4AFociAnIFvLAs4L"
let  endpoint = "https://api.sandbox.amadeus.com/v1.2/cars/search-circle"
          
typealias responseHandler = (_ response:FindACarResponse? , _ apiResponse:APIResponse) ->()
          
class APIHandler{
    
    func buildRequestURL(requestData:FindACarRequest)->URL?{
        let requestURL = "?apikey=\(apiKey)&latitude=\(requestData.latitude ?? 0)&longitude=\(requestData.longitude ?? 0)&radius=\(requestData.radius ?? 0)&pick_up=\(requestData.pick_up ?? "")&drop_off=\(requestData.drop_off ?? "")"
        guard let fullURL =  URL(string: endpoint + requestURL) else{
            return nil
        }
        return fullURL
    }
    
    func createARequestWithURL(requestData:FindACarRequest,
                               success:@escaping(responseHandler),
                               fail:@escaping(responseHandler)){
        
        //build complete url
        guard let url:URL = buildRequestURL(requestData: requestData) else{
            return
        }
        //create URL get Request
        guard var request = try? URLRequest(url: url) else{
            return
        }
        request.httpMethod = "GET"
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request) { (data, resp, err) in
                //decode the response data from API
                var apiRespone = APIResponse(isError: false, message: "")
                guard let respData = data else{
                    return
                }
                guard let response = resp as? HTTPURLResponse else {
                    print("Could not cast the API response to HTTPURLResponse")
                    return
                }
                guard let findACarModel = try? JSONDecoder().decode(FindACarResponse.self, from: respData)else{
                    print("error occured with code + \(err?.localizedDescription ?? "")")
                    return
                }
           
                //validate response
                if response.statusCode == 200{
                    apiRespone.isError = false
                    apiRespone.message = String(response.statusCode)
                    success(findACarModel,apiRespone)
                }
                else{
                    apiRespone.isError = true
                    apiRespone.message = String(response.statusCode)
                    fail(findACarModel,apiRespone)
                    }
                }.resume()
            }
        }
    
    
    //enter your address
    //or get location from map
    
 
    
    
    //find the car based on address pickup
//    Finding a car
//    Based on an address, pickup date, and drop-off date return a list of rentals. This list should be sortable by company, distance, and price (ascending and descending order)
//    Upon user selection provide rental details
//    Directions to pickup the rental
//    There should be a call to action showing user's the nearest pickup location and directions on how to get there.
//    Make the app look as appealing as possible to use
    
    
    
    
    
    
}
