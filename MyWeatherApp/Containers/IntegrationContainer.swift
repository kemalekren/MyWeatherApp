//
//  IntegrationContainer.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation
import Swinject

enum IntegrationContainer: ContainerBuilder {
    static func build(in container: Container) {
        buildBackgroundComponents(container: container)
        buildIntegration(container: container)
    }
    
    private static func buildBackgroundComponents(container: Container) {
        container.register(HomeAppRepositoryProtocol.self) {
            HomeAppRepository(
                repository: DefaultHomeOnlineRepository(
                    requestPerformer: $0.resolve(RequestPerformer.self)!
                )
            )
        }.inObjectScope(.container)
    }
    
    private static func buildIntegration(container: Container) {
        
        container.register(NetworkURLManager.self) { _
            in DefaultNetworkURLManager()
        }
        
        container.register(RequestPerformer.self) { _ in
            DefaultRequestPerformer()
        }
    }
}

