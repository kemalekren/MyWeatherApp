//
//  SearchAppRepository.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore

protocol SearchAppRepositoryProtocol {
    func searchCity(with parameters: SearchRequestModel) -> AnyPublisher<[SearchResultModel], NetworkError>
}

struct SearchAppRepository: SearchAppRepositoryProtocol {
    private let repository: SearchOnlineRepository
    
    init(repository: SearchOnlineRepository) {
        self.repository = repository
    }
    
    func searchCity(with parameters: SearchRequestModel) -> AnyPublisher<[SearchResultModel], NetworkError> {
        repository.searchCity(with: parameters)
    }
}


