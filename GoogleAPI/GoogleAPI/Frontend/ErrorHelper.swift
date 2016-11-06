//
//  ErrorHelper.swift
//  GoogleAPI
//
//  Created by Rodrigo on 06/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit

class ErrorHelper {
    func getErrorMessage (statusCode: Int) -> String {
        var message: String?
        if (statusCode >= 400 && statusCode < 500) {
            message = "Request Error"
        } else if (statusCode >= 500 && statusCode < 600) {
            message = "Service unavailable"
        } else {
            message = "No connection, check and try again"
        }
        return message!
    }

}
