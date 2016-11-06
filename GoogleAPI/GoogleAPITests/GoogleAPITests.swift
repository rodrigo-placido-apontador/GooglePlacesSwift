//
//  GoogleAPITests.swift
//  GoogleAPITests
//
//  Created by Rodrigo on 03/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import XCTest
@testable import GoogleAPI

class GoogleAPITests: XCTestCase {
    var placesArray = NSMutableArray()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let masterDataUrl: NSURL = Bundle.main.url(forResource: "place", withExtension: "json")! as NSURL
        
        let jsonData: NSData = NSData(contentsOf: masterDataUrl as URL)!
        do {
            let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options:  JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            let modelConverter: PlaceConverter = PlaceConverter()
            placesArray = modelConverter.convertModel(json: jsonResult)
        } catch {
            print("json error: \(error)")
        }

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlacesCount() {
        XCTAssertEqual(placesArray.count, 6)
    }
    
    func testPlace() {
        let place: Place = placesArray[0] as! Place
        XCTAssertEqual(place.name, "The Bay Detail")
        XCTAssertEqual(place.vicinity, "45 3rd St, San Francisco")
        XCTAssertEqual(place.icon, "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png")
        XCTAssertEqual(place.openingHours?.openNow, "1")
    }

    
    func testErrorCode() {
        let errorHelper = ErrorHelper()
        
        var message: NSString = errorHelper.getErrorMessage(statusCode:-1009) as NSString
        XCTAssertEqual(message, "No connection, check and try again")
        
        message = errorHelper.getErrorMessage(statusCode:403) as NSString
        XCTAssertEqual(message, "Request Error")
        
        message = errorHelper.getErrorMessage(statusCode:503) as NSString
        XCTAssertEqual(message, "Service unavailable")
    }

    func testOpenNowColor() {
        let placeUtil = PlaceUtils()
        
        var color = placeUtil.getOpenNowColor(openNow: "1")
        XCTAssertEqual(color, UIColor.green)
        
        color = placeUtil.getOpenNowColor(openNow: "0")
        XCTAssertEqual(color, UIColor.red)
    }
    
    func testOpenNowText() {
        let placeUtil = PlaceUtils()
        
        var message = placeUtil.getOpenNowString(openNow: "1")
        XCTAssertEqual(message, "Aberto")
        
        message = placeUtil.getOpenNowString(openNow: "0")
        XCTAssertEqual(message, "Fechado")
    }

}
