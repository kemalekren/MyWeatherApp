//
//  DefaultSearchOnlineRepository.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore

protocol SearchOnlineRepository {
    func searchCity(with parameters: SearchRequestModel) -> AnyPublisher<[SearchResultModel], NetworkError>
}

final class DefaultSearchOnlineRepository: BaseOnlineRepository,SearchOnlineRepository {
    func searchCity(with parameters: SearchRequestModel) -> AnyPublisher<[SearchResultModel], NetworkError> {
        let request = SearchRequest(parameters: parameters.stringDictionary)
        return requestPerformer.performDataTask(with: request, responseType: [SearchResultModel].self)
    }
}
