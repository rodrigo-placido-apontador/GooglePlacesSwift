//
//  PlacesTableViewController.swift
//  GoogleAPI
//
//  Created by Rodrigo on 05/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit
import CoreLocation
import Kingfisher

class PlacesTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    var placesArray: NSMutableArray?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.placesArray = NSMutableArray()
        self.getLocation()
        self.title = "Places"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func loadPlaces(lat: Double, lon: Double) {
        let googleAPIController = GoogleAPIController()
        googleAPIController.getGooglePlaces(lat: lat, lon: lon) { (placesArray, statusCode) in
            self.placesArray = placesArray
            self.tableView.reloadData()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate:CLLocationCoordinate2D = manager.location!.coordinate
        self.loadPlaces(lat: coordinate.latitude, lon: coordinate.longitude)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.placesArray?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        
        if let place = self.placesArray?[indexPath.row] as? Place {
            cell.lblPlaceName.text = place.name
            cell.lblPlaceVicinity.text = place.vicinity
            let imageURL = URL(string: (place.icon)!)
            cell.imgPlace.kf.setImage(with: imageURL)
        }
        return cell
    }
}
