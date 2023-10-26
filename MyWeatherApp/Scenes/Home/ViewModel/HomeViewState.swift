//
//  HomeViewState.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

enum HomeViewState: Equatable {
    case loading
    case initial
    case loaded
    case error(Error)

    static func == (lhs: HomeViewState, rhs: HomeViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial),
             (.loading, .loading),
            (.loaded, .loaded):
            return true
        case let (.error(e1), .error(e2)):
            return e1.localizedDescription == e2.localizedDescription
        default:
            return false
        }
    }
}

