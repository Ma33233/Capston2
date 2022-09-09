//
//  ImageCollectionViewCell.swift
//  Capstone2
//
//  Created by Maan Abdullah on 09/09/2022.
//

import UIKit
import CoreLocation
class ImageCollectionViewCell: UICollectionViewCell {
    
    var fetchedImage: String?
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    
//    func getImageLocation(id: String?){
//      //  1. Step one:
//        guard let id = id else {
//            return}
//             let stringURL = "https://www.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=372018c5205cf1fca8a86006716de2f8&photo_id=\(id)&format=json&nojsoncallback=1"
//             guard let url = URL(string: stringURL) else {return}
//             //2. Step two:
//             let task =  URLSession.shared.dataTask(with: url) {data, response, error in
//                 guard error ==  nil else {
//                     print(error?.localizedDescription as Any)
//                     return }
//
//                 guard let response = response as? HTTPURLResponse else {
//                     print("Invaild Response")
//                     return }
//
//                 guard response.statusCode >= 200 && response.statusCode < 300 else {
//                     print("Status code should be 2xx, but the code is \(response.statusCode)")
//                     return
//                 }
//                 print("Successful get data 🤩")
//
//                 guard let fetchImage = try? JSONDecoder().decode(ImagesLatLong.self, from: data!) else {
//                     return
//                 }
//                 self.fetchedImage =
//                 DispatchQueue.main.async {
//                     self.imagesCollcetionView.reloadData()
//                 }
//             }
//             task.resume()
//         }
//
//
//     }
    
    func getImage(url: String?){
        guard let imageUrl = url else {
            print("url error")
            return
        }
        let url = URL(string: imageUrl)
        let data = try? Data(contentsOf: url!)
        image.image = UIImage(data: data!)
    }
}


extension ImageCollectionViewCell: CLLocationManagerDelegate{
    
}
