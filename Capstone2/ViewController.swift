//
//  ViewController.swift
//  Capstone2
//
//  Created by Maan Abdullah on 09/09/2022.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D?
    var fetchedImages: [Photo] = []
    @IBOutlet weak var imagesCollcetionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollcetionView.dataSource = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userLocation = locationManager.location?.coordinate
        print(userLocation!)
        fetchImages()
    }
    
    func fetchImages(){
//        1. Step one:
        let stringURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=372018c5205cf1fca8a86006716de2f8&lat=40.730610&lon=-73.935242&radius=1&format=json"
        guard let url = URL(string: stringURL) else {return}
        print(url)
        //2. Step two:
        let task =  URLSession.shared.dataTask(with: url) {data, response, error in
            guard error ==  nil else {
                print(error?.localizedDescription as Any)
                return }

            guard let response = response as? HTTPURLResponse else {
                print("Invaild Response")
                return }

            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but the code is \(response.statusCode)")
                return
            }
            print("Successful get data 🤩")

            guard let fetchImages = try? JSONDecoder().decode(ImagesFetched.self, from: data!) else {
                print("I cant")
                return
            }
//            print(fetchImages.photos.photo[0].id)

            
//            self.fetchedImages = fetchImages.photos.photo
//            DispatchQueue.main.async {
//                self.imagesCollcetionView.reloadData()
//            }




        }
        task.resume()
    }


}




extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "imageItem", for: indexPath)
//        item.image.image = getImage()
//        item.distanceLabel.text  =
        return item
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - sectionInsets
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width / 1.5
        return CGSize(width: width, height: height)
        
    }
}
