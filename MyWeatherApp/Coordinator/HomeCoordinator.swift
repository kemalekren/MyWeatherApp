//
//  HomeCoordinator.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import UIKit

/// Home Coordinator
final class HomeCoordinator: NSObject, Coordinator {
    // MARK: - Private Properties
    
    private let appCoordinator: AppCoordinator
    
    private(set) var rootViewController: UINavigationController?
    
    private(set) var childCoordinators = [Coordinator]()
    
    // MARK: Initializer

    /// An OnboardingCoordinator's default initializer.
    ///
    /// - Parameters:
    ///   - appCoordinator: Application's main coordinator.
    ///   - rootViewController: Rootview controller instance.
    init(appCoordinator: AppCoordinator, rootViewController: UINavigationController?) {
        self.appCoordinator = appCoordinator
        self.rootViewController = rootViewController
    }
    
    func start() {
        
    }
}
