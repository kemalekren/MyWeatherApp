//
//  MockHomeAppRepository.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore
@testable import MyWeatherApp

final class MockHomeAppRepository: HomeAppRepositoryProtocol {
    let mockResultModel: MockHomeResultModel
    
    init(mockResultModel: MockHomeResultModel) {
        self.mockResultModel = mockResultModel
    }
    
    func getWeatherData(with parameters: MyWeatherApp.HomeRequestModel) -> AnyPublisher<MyWeatherApp.HomeResultModel, NgNetworkModuleCore.NetworkError> {
        mockResultModel.mockHomeResultModelPublisher()
    }
}
