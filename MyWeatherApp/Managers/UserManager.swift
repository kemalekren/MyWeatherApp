//
//  UserManager.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation
import Combine

protocol UserManager: AnyObject {
    func saveCitySelection(cityDetails: SearchModel) -> AnyPublisher<Void, Error>
    
    func getCityDetails() -> AnyPublisher<SearchModel, Never>
}

final class DefaultUserManager: UserManager {
    private var selectedCity: SearchModel = SearchModel(longitude: 0, latitude: 0, name: "")
    
    func saveCitySelection(cityDetails: SearchModel) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
            .tryMap { [weak self] in
                try self.throwing().selectedCity = cityDetails
            }
            .eraseToAnyPublisher()
    }
    
    func getCityDetails() -> AnyPublisher<SearchModel, Never> {
        Just(selectedCity)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
