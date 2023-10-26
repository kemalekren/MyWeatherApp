//
//  HomeResultModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

struct HomeResultModel: Codable {
     let weather: [Weather]
     let weatherDetails: WeatherDetails
     let visibility: Int
     let wind: Wind
     let updatedTime: Int
     let dayDetails: DayDetails
     let name: String
    
    private enum CodingKeys: String, CodingKey {
        case weather,visibility,wind, name
        case weatherDetails = "main"
        case updatedTime = "dt"
        case dayDetails = "sys"
    }
}

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

struct WeatherDetails: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    private enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
struct DayDetails: Codable {
    let sunrise, sunset: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}
