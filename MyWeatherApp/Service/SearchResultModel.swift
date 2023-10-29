//
//  SearchResultModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

struct SearchResultModel: Codable {
    let lat, lon: Double
    let name: String
}
