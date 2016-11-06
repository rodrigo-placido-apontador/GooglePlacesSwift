//
//  Place.swift
//  GoogleAPI
//
//  Created by Rodrigo on 05/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import Foundation
import Unbox

class Place: Unboxable{
  
    var name: String?
    var openingHours: OpeningHours?
    var icon: String?
    var vicinity: String?
    
    required init(unboxer: Unboxer) {
        self.name = unboxer.unbox(key: "name")
        self.openingHours = unboxer.unbox(key: "opening_hours")
        self.icon = unboxer.unbox(key: "icon")
        self.vicinity = unboxer.unbox(key: "vicinity")
    }
}
