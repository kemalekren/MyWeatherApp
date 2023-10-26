//
//  HomeVCBuilder.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

enum HomeNavigationEvent {
    case search
}

protocol HomeSceneRoutes: ViewControllerRoutes {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>? { get set }
}

protocol HomeSceneBuilder {
    func create() -> HomeSceneRoutes
}

final class DefaultHomeSceneBuilder: BaseBuilder, HomeSceneBuilder {
    func create() -> HomeSceneRoutes {
        /// Home Repository
        let repository = container.resolve(HomeAppRepositoryProtocol.self)!
        
        /// Home Scene View Model
        let viewModel = HomeViewModel(repository: repository)
        
        /// Home Scene Main Scene
        let view = HomeScene(viewModel: viewModel)
        
        /// Home Scene Controller
        let controller = HomeVC(rootView: view, viewModel: viewModel)
    
        return controller
    }
}
