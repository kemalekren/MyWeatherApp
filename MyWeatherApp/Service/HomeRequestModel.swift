//
//  HomeRequestModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

struct HomeRequestModel: Codable {
    let lat: String?
    let lon: String?
    let cityName: String?
    let units: String?
    let token = TokenManager.token
    
    private enum CodingKeys: String, CodingKey {
        case lat,lon, units
        case cityName = "q"
        case token = "APPID"
    }
}
