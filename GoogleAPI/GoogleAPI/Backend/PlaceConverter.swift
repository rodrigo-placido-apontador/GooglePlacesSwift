//
//  PlaceConverter.swift
//  GoogleAPI
//
//  Created by Rodrigo on 05/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import Foundation
import Unbox

class PlaceConverter{
    
    func convertModel(json: NSDictionary) -> NSMutableArray {
        let placesArray:NSMutableArray? = NSMutableArray()
        let jsonResults: NSArray
        jsonResults = json["results"] as! NSArray
        for jsonPlaces in jsonResults {
            do{
                let place: Place = try unbox(dictionary: jsonPlaces as! UnboxableDictionary)
                placesArray!.add(place)
            } catch { }
        }
        return placesArray!
    }
}
