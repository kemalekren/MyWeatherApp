//
//  TokenManager.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

final class TokenManager {
    static var shared = TokenManager()
    
    var token: String {
        if let token = ProcessInfo.processInfo.environment["API_KEY"] {
            return token
        }
        return ""
    }
}
