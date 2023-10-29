//
//  HomeWeatherModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 27/10/2023.
//

import Foundation

struct HomeWeatherMainModel: Equatable, Hashable {
    static func == (lhs: HomeWeatherMainModel, rhs: HomeWeatherMainModel) -> Bool {
        lhs.weather == rhs.weather
    }
    
    let weather: HomeWeatherModel
    let weatherDetails: HomeWeatherDetailModel
}

extension HomeWeatherMainModel {
    init(response: HomeResultModel, cityName: String?) {
        self.weather = HomeWeatherModel(response: response, cityName: cityName)
        self.weatherDetails = HomeWeatherDetailModel(response: response)
    }
}

struct HomeWeatherModel: Equatable, Hashable {
    let weatherType: String
    let weatherDescription: String
    let weatherIconURL: String
    let updatedTime: String
    let temprature: String
    let minTemprature: String
    let maxTemprature: String
    let cityName: String
}

extension HomeWeatherModel {
    init(response: HomeResultModel, cityName: String?) {
        if let weather = response.weather.first  {
            self.weatherType = weather.weatherType
            self.weatherDescription = weather.weatherDetail
            self.weatherIconURL = weather.weatherIconURL
        } else {
            self.weatherType = "No Data"
            self.weatherDescription = "No Data"
            self.weatherIconURL = "No Data"
        }
        self.updatedTime = response.updatedTime.toReadableDate()
        self.temprature = response.weatherDetails.temp.formattedString
        self.minTemprature = response.weatherDetails.tempMin.formattedString
        self.maxTemprature = response.weatherDetails.tempMax.formattedString
        if let cityName = cityName, !cityName.isEmpty {
            self.cityName = cityName
        } else {
            self.cityName =  "My Location"
        }
       
    }
}

struct HomeWeatherDetailModel: Equatable, Hashable {
    let windSpeed: String
    let windDegree: Double
    let windGust: String?
    let sunRiseTime: String
    let sunSetTime: String
    let feelsLike: String
    let pressure: String
    let humidity: String
    let visibility: String
}

extension HomeWeatherDetailModel {
    init(response: HomeResultModel) {
        self.windSpeed = response.wind.speed.formattedString
        self.windDegree = Double(response.wind.deg)
        self.windGust = response.wind.gust?.formattedString
        self.sunRiseTime = response.dayDetails.sunrise.toReadableTime()
        self.sunSetTime = response.dayDetails.sunset.toReadableTime()
        self.feelsLike = response.weatherDetails.feelsLike.formattedString
        self.pressure = response.weatherDetails.pressure.toString
        self.humidity = response.weatherDetails.humidity.toString
        self.visibility = response.visibility.toShortString
    }
}
