//
//  NetworkURLManager.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

protocol NetworkURLManager {
    var apiURL: URL { get }
    var baseURL: String { get }
}

final class DefaultNetworkURLManager: NetworkURLManager {
    private var urlScheme: String {
        "https://"
    }

    var apiURL: URL {
        URL(string: urlScheme + baseURL)!
    }

    var baseURL: String {
        let token = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
        switch AppScheme.current {
        case .development:
            return "api.openweathermap.org/"
        case .staging:
            return "api.openweathermap.org"
        case .production:
            return "api.openweathermap.org"
        }
    }
}
