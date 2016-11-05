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
    
    required init(unboxer: Unboxer) {
        self.name = unboxer.unbox(key: "name")
    }
}
