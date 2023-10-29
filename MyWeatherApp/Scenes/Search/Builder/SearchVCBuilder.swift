//
//  SearchVCBuilder.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

enum SearchNavigationEvent {
    case back, select
}

protocol SearchSceneRoutes: ViewControllerRoutes {
    var navigationEventHandler: CustomHandler<SearchNavigationEvent>? { get set }
}

protocol SearchSceneBuilder {
    func create() -> SearchSceneRoutes
}

final class DefaultSearchSceneBuilder: BaseBuilder, SearchSceneBuilder {
    func create() -> SearchSceneRoutes {
        /// Search Repository
        let repository = container.resolve(SearchAppRepositoryProtocol.self)!
        
        /// Debounce Manager
        let debounceManager = container.resolve(DebounceManagerProcotol.self)!
        
        /// User Manager
        let userManager = container.resolve(UserManager.self)!
        
        /// Search Scene View Model
        let viewModel = SearchViewModel(repository: repository, debounceManager: debounceManager, userManager: userManager)
        
        /// Search Scene Main Scene
        let view = SearchScene(viewModel: viewModel)
        
        /// Search Scene Controller
        let controller = SearchVC(rootView: view, viewModel: viewModel)
    
        return controller
    }
}
