//
//  PlaceDetailViewController.swift
//  GoogleAPI
//
//  Created by Rodrigo on 06/11/16.
//  Copyright © 2016 Rodrigo. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController {

    var place: Place?
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlaceVicinity: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblOpenNow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = place?.name
        self.loadPlace()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlace() {
        self.lblName.text = place?.name
        self.lblPlaceVicinity.text = place?.vicinity
        self.lblOpenNow.text = "Aberto"
        let imageURL = URL(string: (place?.icon)!)
        self.imgIcon.kf.setImage(with: imageURL)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
