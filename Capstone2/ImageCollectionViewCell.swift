//
//  ImageCollectionViewCell.swift
//  Capstone2
//
//  Created by Maan Abdullah on 09/09/2022.
//

import UIKit
import CoreLocation
class ImageCollectionViewCell: UICollectionViewCell {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    func getImage(url: String){
        
    }
}


extension ImageCollectionViewCell: CLLocationManagerDelegate{
    
}
