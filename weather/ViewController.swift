//
//  ViewController.swift
//  weather
//
//  Created by bartek ryba on 28.02.2016.
//  Copyright © 2016 Bartdevs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let date = NSDate()
    
    @IBOutlet weak var collection: UICollectionView!
    
    var weatherDays = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        let test = Weather(cityId: 524901)
        test.downloadWeatherDetails { () -> () in
            self.updateUI()
            print("Checkpoint 1")
        }
        weatherDays.append(test)
        print("Checkpoint 2")
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCellWithReuseIdentifier("DayCell", forIndexPath: indexPath) as? DayCell {
            
            cell.configureCell(weatherDays[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherDays.count
    }
    
    func updateUI() {
        
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//    }
    
}

