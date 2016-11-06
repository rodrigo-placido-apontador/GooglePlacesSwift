//
//  PlaceUtils.swift
//  GoogleAPI
//
//  Created by Rodrigo on 06/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit

class PlaceUtils {
    
    func getOpenNowString(openNow: String) -> String {
        return (openNow == "0") ? "Fechado" : "Aberto"
    }
    
    func getOpenNowColor(openNow: String) -> UIColor {
        return (openNow == "0") ? UIColor.red : UIColor.green
    }
}
