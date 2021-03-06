//
//  GoogleAPIController.swift
//  GoogleAPI
//
//  Created by Rodrigo on 03/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import Foundation
import Alamofire

class GoogleAPIController {
   
    let api = API()
    
    func getGooglePlaces(lat: Double, lon: Double, completionHandler: @escaping (NSMutableArray?, Int?) -> ()) -> () {
        let googleAPIUrl = api.getUrlGoogleAPI(lat: lat, lon: lon, radius: 5000)
        Alamofire.request(googleAPIUrl).responseJSON { response in
            
            var statusCode = response.response?.statusCode
            if let error = response.result.error as? AFError {
                statusCode = error._code
            }
            
            var placeArray: NSMutableArray? = NSMutableArray()
            if let JSON = response.result.value {
                let placeConverter: PlaceConverter? = PlaceConverter()
                placeArray = placeConverter?.convertModel(json: JSON as! NSDictionary)
            }
            completionHandler(placeArray, statusCode)
        }
    }
}
