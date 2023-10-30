//
//  MockHomeResultModel.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore
@testable import MyWeatherApp

final class MockHomeResultModel {
    var model: HomeResultModel
    
    init() {
        self.model = PreviewMocks.mockHomeResultModel
    }
    
    func mockHomeResultModelPublisher() -> AnyPublisher<HomeResultModel, NetworkError> {
        Just(model)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
