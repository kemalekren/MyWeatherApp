//
//  MockUserManager.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import Foundation
@testable import MyWeatherApp
import Combine

final class MockUserManager: UserManager {
    private let mockSaveCitySelection = PassthroughSubject<Void, Error>()
    private let mockGetCity = PassthroughSubject<SearchModel, Never>()
    
    func saveCitySelection(cityDetails: SearchModel) -> AnyPublisher<Void, Error> {
        mockSaveCitySelection.eraseToAnyPublisher()
    }
    
    func getCityDetails() -> AnyPublisher<SearchModel, Never> {
        mockGetCity.eraseToAnyPublisher()
    }
}
