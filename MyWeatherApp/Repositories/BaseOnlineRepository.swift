//
//  BaseOnlineRepository.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

class BaseOnlineRepository {
    /// Runs requests
    let requestPerformer: RequestPerformer

    /// Initialize components.
    /// - Parameters:
    ///   - apiPerfomer: Repository with api request methods.
    init(requestPerformer: RequestPerformer) {
        self.requestPerformer = requestPerformer
    }
}

