//
//  PreviewMocks.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import Foundation
import NgNetworkModuleCore

enum PreviewMocks {
    static let mockHomeResultModel = HomeResultModel(
        weather: [mockWeatherModel],
        weatherDetails: mockWeatherDetails,
        visibility: 0,
        wind: mockWindModel,
        updatedTime: 0,
        dayDetails: mockDayDetails,
        cityName: "")
    
    static let mockWeatherModel = Weather(
        id: 0,
        weatherType: "",
        weatherDetail: "",
        weatherIconURL: ""
    )
    
    static let mockWeatherDetails = WeatherDetails(
        temp: 0,
        feelsLike: 0,
        tempMin: 0,
        tempMax: 0,
        pressure: 0,
        humidity: 0
    )
    
    static let mockWindModel = Wind(
        speed: 0,
        deg: 0,
        gust: 0
    )
    
    static let mockDayDetails = DayDetails(sunrise: 0, sunset: 0)
    
    static let mockHomeWeatherMainModel =
    HomeWeatherMainModel(
        weather: mockHomeWeatherModel,
        weatherDetails: mockHomeWeatherDetailModel
    )
    
    static let mockHomeWeatherModel = HomeWeatherModel(response: mockHomeResultModel, cityName: "")
    static let mockHomeWeatherDetailModel = HomeWeatherDetailModel(response: mockHomeResultModel)
}
