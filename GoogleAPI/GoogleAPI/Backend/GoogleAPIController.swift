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
    
    func getGooglePlaces(completionHandler: @escaping (NSMutableArray?, Int?) -> ()) -> () {
        let googleAPIUrl = api.getUrlGoogleAPI(lat: -23.2, lon: -45.3, radius: 5000)
        Alamofire.request(googleAPIUrl).responseJSON { response in
            let statusCode: Int
            statusCode = (response.response?.statusCode)!
            var placeArray: NSMutableArray? = NSMutableArray()
            if let JSON = response.result.value {
                let placeConverter: PlaceConverter? = PlaceConverter()
                placeArray = placeConverter?.convertModel(json: JSON as! NSDictionary)
            }
            completionHandler(placeArray, statusCode)
        }
    }
}
