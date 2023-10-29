//
//  SearchRequestModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

struct SearchRequestModel: Codable {
    let cityName: String?
    let limit: String
    let token = TokenManager.token
    
    private enum CodingKeys: String, CodingKey {
        case limit
        case cityName = "q"
        case token = "APPID"
    }
}
