//
//  PlacesTableViewController.swift
//  GoogleAPI
//
//  Created by Rodrigo on 05/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    var placesArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPlaces()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlaces() {
        self.placesArray = NSMutableArray()
        let googleAPIController = GoogleAPIController()
        googleAPIController.getGooglePlaces { (placesArray, statusCode) in
            self.placesArray = placesArray;
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.placesArray?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        
        if let place = self.placesArray?[indexPath.row] as? Place {
            cell.lblPlaceName.text = place.name
        }
        return cell
    }

}
