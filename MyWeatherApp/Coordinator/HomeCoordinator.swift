//
//  HomeCoordinator.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import UIKit
import Swinject

/// Home Coordinator
final class HomeCoordinator: NSObject, Coordinator {
    // MARK: - Private Properties
    
    private let appCoordinator: AppCoordinator
    
    private(set) var rootViewController: UINavigationController?
    
    private(set) var childCoordinators = [Coordinator]()
    
    let container: Container
    
    // MARK: Initializer
    
    /// An OnboardingCoordinator's default initializer.
    ///
    /// - Parameters:
    ///   - appCoordinator: Application's main coordinator.
    ///   - rootViewController: Rootview controller instance.
    init(appCoordinator: AppCoordinator, container: Container) {
        self.appCoordinator = appCoordinator
        self.container = container
        self.rootViewController = UINavigationController()
        rootViewController?.isNavigationBarHidden = true
    }
    
    func start() {
        startHomeSceneFlow()
    }
}

private extension HomeCoordinator {
    func startHomeSceneFlow() {
        let homeSceneRoutes = container.homeRoutes
        homeSceneRoutes.navigationEventHandler = { [weak self] route in
            switch route {
            case .search:
                self?.startSearchSceneFlow()
            }
        }
        rootViewController?.setViewControllers([homeSceneRoutes], animated: true)
    }
    
    func startSearchSceneFlow() {
        let searchSceneRoutes = container.searchRoutes
        
        searchSceneRoutes.navigationEventHandler = { [weak self] route in
            switch route {
            case .back, .select:
                self?.backToPreviousScene()
            }
        }
        rootViewController?.pushViewController(searchSceneRoutes, animated: true)
    }
    
    func backToPreviousScene() {
        rootViewController?.popViewController(animated: true)
    }
}

// MARK: Container Implementation Details

private extension Container {
    var homeRoutes: HomeSceneRoutes {
        resolve(DefaultHomeSceneBuilder.self)!.create()
    }
    
    var searchRoutes: SearchSceneRoutes {
        resolve(DefaultSearchSceneBuilder.self)!.create()
    }
}
