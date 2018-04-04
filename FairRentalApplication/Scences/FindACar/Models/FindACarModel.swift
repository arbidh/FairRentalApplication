//
//  FindACarModel.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import Foundation

// MARK: - MODEL
/// This class is the model for Request and Response
///

struct FindACarRequest: Codable{
    init() {
    }
    var latitude:Double?
    var longitude:Double?
    var radius:Int?
    var pick_up:String?
    var drop_off:String?
    var lang:String?
    var currency:String?
    var provide:String?
    var rate_class:String?
    var rate_filter:String?
    var vehicle:String?
    
}
struct APIResponse{
    var isError: Bool
    var message: String?
}

struct FindACarResponse:Codable{
    var results:[resultData]
}

struct resultData:Codable{
    var provider:Providers
    var branch_id:String
    var location:Location
    var address:Address
    var cars:[Cars]
}
struct Providers:Codable{
    var company_code:String
    var company_name:String
}
struct Location:Codable{
    var latitude:Double
    var longitude:Double
}
struct Address:Codable{
    var line1:String
    var city: String
    var region:String
    var country:String
}
struct Cars:Codable{
    var vehicle_info:Vehicle_Info
    var rates:[Rates]
    var estimated_total:EstimatedTotal
}
struct Vehicle_Info:Codable{
    var acriss_code:String
    var transmission:String
    var fuel:String
    var air_conditioning:Bool
    var category:String
    var type:String
}
struct Rates:Codable{
    var type:String
    var price:Price
}
struct Price:Codable{
    var amount:String
    var currency:String
}
struct EstimatedTotal:Codable{
    var amount:String
    var currency:String
}
struct FindACarViewModel{
    var fetchedResultData:[resultData]
}
