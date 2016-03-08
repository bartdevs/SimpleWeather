//
//  DayCell.swift
//  weather
//
//  Created by bartek ryba on 02.03.2016.
//  Copyright © 2016 Bartdevs. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    
    private var _weather: Weather!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(weather: Weather) {
        _weather = weather
        
        
    }
    
}
