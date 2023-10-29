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
        
        container.register(SearchAppRepositoryProtocol.self) {
            SearchAppRepository(
                repository: DefaultSearchOnlineRepository(
                    requestPerformer: $0.resolve(RequestPerformer.self)!
                )
            )
        }.inObjectScope(.container)
    }
    
    private static func buildIntegration(container: Container) {
        container.register(LocationManager.self) { _ in
            LocationPermission()
        }
        
        container.register(DebounceManagerProcotol.self) { _ in
            DebounceManager()
        }
        
        container.register(UserManager.self) { _ in
            DefaultUserManager()
        }.inObjectScope(.container)
        
        container.register(NetworkURLManager.self) { _
            in DefaultNetworkURLManager()
        }
        
        container.register(RequestPerformer.self) { _ in
            DefaultRequestPerformer()
        }
    }
}

