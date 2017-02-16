//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//
import UIKit
import Alamofire

class Forecast {
    
    var _name: String!
    var _cat: String!
    var _short_desc: String!
    var _venue: String!
    var _date: String!
    
  
    
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        print("magic")
//        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
//            
//            if let min = temp["min"] as? Double {
//                
//                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
//                
//                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
//                
//                self._lowTemp = "\(kelvinToFarenheit)"
//            }
        if let name = weatherDict["name"] as? String {
                         self._name = weatherDict["name"] as! String!
         }
        if let cat = weatherDict["cat"] as? String {
            self._cat = weatherDict["cat"] as! String!
        }
        if let short_desc = weatherDict["short_desc"] as? String {
            self._short_desc = weatherDict["short_desc"] as! String!
        }
        if let venue = weatherDict["venue"] as? String {
            self._venue = weatherDict["venue"] as! String!
        }
        if let date = weatherDict["date"] as? String {
            self._date = weatherDict["date"] as! String!
        }
//
//            if let max = temp["max"] as? Double {
//                
//                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
//                
//                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
//                
//                self._highTemp = "\(kelvinToFarenheit)"
//                
//            }
//            
//        }
//        
//        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
//            
//            if let main = weather[0]["main"] as? String {
//                self._weatherType = main
//            }
//        }
//        
//        if let date = weatherDict["dt"] as? Double {
//            
//            let unixConvertedDate = Date(timeIntervalSince1970: date)
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .full
//            dateFormatter.dateFormat = "EEEE"
//            dateFormatter.timeStyle = .none
//            self._date = unixConvertedDate.dayOfTheWeek()
//        }
        
    }
}















