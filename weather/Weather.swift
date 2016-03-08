//
//  Weather.swift
//  weather
//
//  Created by bartek ryba on 02.03.2016.
//  Copyright © 2016 Bartdevs. All rights reserved.
//

import Foundation
import Alamofire

var degreeUnit = DEGREE_CELSIUS
var currentUnit = METRIC

class Weather {
    
    private var _weatherUrl: String!
    
    private var _temperature: Float!
    private var _isDay: Bool!
    private var _weatherDesc: String!
    private var _pressure: Float!
    private var _humidity: Float!
    
    private var _cityId: Int!
    private var _latitude: Float!
    private var _longitude: Float!
    
    private var _cityName: String!
    private var _counry: String!
    
    init(cityId: Int) {
        _cityId = cityId
        
        _weatherUrl = "\(BASE_URL)id=\(_cityId)&APPID=\(KEY)&units=\(currentUnit)"
//        _weatherUrl = "http://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=8df3ef2632dc5b44f427796c4e729ca3"
    }
    
    init(lat: Float, lon: Float) {
        _latitude = lat
        _longitude = lon
    }
    
    func imageNameForDesc(desc: String) -> String{
        return ""
    }
    
    func downloadWeatherDetails(complete: DownloadComplete) {
        let url = NSURL(string: _weatherUrl)!

        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {

                    if let main = list[1]["main"] as? Dictionary<String, AnyObject> {
                        
                        if let temp = main["temp"] as? Float {
                            self._temperature = temp
                        }
                        
                        if let pressure = main["pressure"] as? Float {
                            self._pressure = pressure
                        }
                        
                        if let humidity = main["humidity"] as? Float {
                            self._humidity = humidity
                        }
                    }
                }
            }
        }
    }
}


