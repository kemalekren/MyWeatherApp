//
//  SearchViewState.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

enum SearchViewState: Equatable {
    case loading
    case initial
    case parseError
    case loaded([SearchModel])
    case error(Error)

    static func == (lhs: SearchViewState, rhs: SearchViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial),
            (.parseError, .parseError),
            (.loading, .loading):
            return true
        case let (.loaded(data1), .loaded(data2)):
            return data1 == data2
        case let (.error(e1), .error(e2)):
            return e1.localizedDescription == e2.localizedDescription
        default:
            return false
        }
    }
}
