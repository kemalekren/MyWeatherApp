//
//  RequestPerformer.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation
import Combine
import NgNetworkModuleCore
import ReactiveNgNetworkModule

protocol RequestPerformer {
    func performDataTask<T>(
        with request: NetworkRequest,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError> where T: Decodable
}

final class DefaultRequestPerformer: RequestPerformer {
    private let networkURLManager = DefaultNetworkURLManager()

    func performDataTask<T>(
        with request: NetworkRequest,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError> where T: Decodable {
        let baseURL = networkURLManager.apiURL
        let requestBuilder = DefaultRequestBuilder(baseURL: baseURL)
        let networkModule = DefaultNetworkModule(requestBuilder: requestBuilder)
       
        return networkModule
            .performAndDecode(request: request, responseType: responseType, decoder: JSONDecoder())
    }
}
