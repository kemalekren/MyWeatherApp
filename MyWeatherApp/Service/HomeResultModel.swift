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
     let cityName: String
    
    private enum CodingKeys: String, CodingKey {
        case weather,visibility,wind
        case weatherDetails = "main"
        case updatedTime = "dt"
        case dayDetails = "sys"
        case cityName = "name"
    }
}

struct Weather: Codable {
    let id: Int
    let weatherType, weatherDetail, weatherIconURL: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case weatherType = "main"
        case weatherDetail = "description"
        case weatherIconURL = "icon"
    }
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
