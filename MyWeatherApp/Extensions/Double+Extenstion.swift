//
//  Double+Extenstion.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

extension Double {
    var formattedString: String {
            return String(format: "%.2f", self)
        }
    
    var toStringWithoutDecimal: String {
          return String(Int(self))
      }

}
