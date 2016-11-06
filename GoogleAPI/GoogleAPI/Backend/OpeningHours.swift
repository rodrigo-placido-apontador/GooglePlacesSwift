//
//  OpeningHours.swift
//  GoogleAPI
//
//  Created by Rodrigo on 06/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit
import Foundation
import Unbox

class OpeningHours: Unboxable {
    var openNow: String?
    
    required init(unboxer: Unboxer) {
        self.openNow = unboxer.unbox(key: "open_now")
    }
}
