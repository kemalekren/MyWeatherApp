//
//  DefaultHomeOnlineRepository.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore

protocol HomeOnlineRepository {
    func getWeatherData(with parameters: HomeRequestModel) -> AnyPublisher<HomeResultModel, NetworkError>
}

final class DefaultHomeOnlineRepository: BaseOnlineRepository,HomeOnlineRepository {
    func getWeatherData(with parameters: HomeRequestModel) -> AnyPublisher<HomeResultModel, NetworkError>{
        let request = HomeRequest(parameters: parameters.stringDictionary)
        return requestPerformer.performDataTask(with: request, responseType: HomeResultModel.self)
    }
}
