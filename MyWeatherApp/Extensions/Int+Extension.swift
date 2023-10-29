//
//  Int+Extension.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

extension Int {
    func toReadableDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    func toReadableTime() -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "HH:mm"
         return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(self)))
     }
    
    var toString: String {
        return String(self)
    }
    
    var toShortString: String {
        return String(self / 1000)
    }
}
