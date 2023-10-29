//
//  SearchModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

struct SearchModel: Equatable, Hashable, Identifiable {
    var id: UUID = UUID()
    let longitude,latitude: Double
    let name: String
    
    
}

extension SearchModel {
    init(response: SearchResultModel) {
        self.longitude = response.lon
        self.latitude = response.lat
        self.name = response.name
    }
}
