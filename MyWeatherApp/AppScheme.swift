//
//  AppScheme.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

enum AppScheme {
    case development
    case staging
    case production
}

extension AppScheme {

    /// Returns current scheme of the app
    static var current: AppScheme {
        #if ENV_DEVELOPMENT
            return .development
        #elseif ENV_STAGING
            return .staging
        #else
            return .production
        #endif
    }
}
