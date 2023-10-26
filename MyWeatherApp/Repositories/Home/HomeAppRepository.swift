//
//  HomeAppRepository.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore

protocol HomeAppRepositoryProtocol {
    func getWeatherData(with parameters: HomeRequestModel) -> AnyPublisher<HomeResultModel, NetworkError>
}

struct HomeAppRepository: HomeAppRepositoryProtocol {
    private let repository: HomeOnlineRepository
    
    init(repository: HomeOnlineRepository) {
        self.repository = repository
    }
    
    func getWeatherData(with parameters: HomeRequestModel) -> AnyPublisher<HomeResultModel, NetworkError> {
        repository.getWeatherData(with: parameters)
    }
}
