//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "42a1771a0b787bf12e734ada0cfc80cb"

typealias DownloadComplete = () -> ()

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=51.50&lon=-0.12&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb"
let FORECAST_URLL = "https://private-anon-c39a5b7f2b-csimem.apiary-mock.com/events"
