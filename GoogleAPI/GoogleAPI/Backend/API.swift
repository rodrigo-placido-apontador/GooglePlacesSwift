//
//  API.swift
//  GoogleAPI
//
//  Created by Rodrigo on 03/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import Foundation

class API {
    
    let kGOOGLE_API_KEY = "AIzaSyAKd1IlCzCkI85rtPu-r4onhHbozsV0DNE"
    let kURL_GOOGLE = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"

    func getUrlGoogleAPI(lat: Double, lon: Double, radius: Int) -> String {
        return kURL_GOOGLE + "?location=\(lat),\(lon)&radius=\(radius)&types=car_repair&key=" + kGOOGLE_API_KEY
    }
    
}

