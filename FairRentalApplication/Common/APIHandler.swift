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

// MARK: - Repsonse Handler
/// ResponseHandler for  APIResposne
///
/// - parameter response:   model for car Rentals FindACarResponse
/// - parameter completion: The completion block for APIResponse
typealias responseHandler = (_ response:FindACarResponse? , _ apiResponse:APIResponse) ->()

// MARK: - API Handler
/// APIHandler to make API connections

class APIHandler{
    
    
    /// Builds request Data
    ///
    /// - parameter response:   model for car Rentals FindACarRequest
    /// - returns url : full url to send to api
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
}
