//
//  CommonContainer.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Swinject

enum CommonContainer: ContainerBuilder {
    static func build(in container: Container) {
        buildUIComponents(container: container)
    }
    
    // MARK: - Build UI Components
    static func buildUIComponents(container: Container) {
        container.register(DefaultHomeSceneBuilder.self) { _ in
            DefaultHomeSceneBuilder(container: container)
        }
        
        container.register(DefaultSearchSceneBuilder.self) { _ in
            DefaultSearchSceneBuilder(container: container)
        }
    }
}
