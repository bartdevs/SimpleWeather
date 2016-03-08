//
//  Constants.swift
//  weather
//
//  Created by bartek ryba on 28.02.2016.
//  Copyright © 2016 Bartdevs. All rights reserved.
//

import Foundation

let DEGREE_CELSIUS = "\u{2103}"
let DEGREE_FAHRENHEIT = "\u{2109}"

let METRIC = "metric"
let IMPERIAL = "imperial"

public typealias DownloadComplete = () -> ()

let KEY = "8df3ef2632dc5b44f427796c4e729ca3"
let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast?"