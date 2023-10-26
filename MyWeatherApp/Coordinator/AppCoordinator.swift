//
//  AppCoordinator.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import UIKit
import SwiftUI
import Swinject

/// App's main coordinator
final class AppCoordinator: Coordinator {
    // MARK: - Private Properties
    
    private let window: UIWindow?
    
    private let container: Container
    
    private(set) var rootViewController: UINavigationController?
    
    private(set) var childCoordinators = [Coordinator]()
    
    // MARK: Initializer

    /// An AppCoordinator's default initializer.
    ///
    /// - Parameters:
    ///   - window: window: A UIWindow instance.
    ///   - container: App Container instance.
    init(window: UIWindow?, container: Container) {
        self.window = window
        self.container = container
        rootViewController = UINavigationController()
        let emptyView = CustomHostingController(view: EmptyView().toolbar(.hidden))
        rootViewController?.setViewControllers([emptyView], animated: false)
        window?.rootViewController = rootViewController
    }
    
    /// Start a coordinator
    func start() {
        childCoordinators.removeAll()
        let homeCoordinator = HomeCoordinator(appCoordinator: self, container: container)
        setupChildCoordinator(homeCoordinator)
    }
}

extension AppCoordinator {
    /// Removes child coordinator if already present.
    func removeChild(coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else {
            return
        }
        for (index, element) in childCoordinators.enumerated() {
            guard element === coordinator else { return }
            childCoordinators.remove(at: index)
            break
        }
    }
}

// MARK: Implementation details

private extension AppCoordinator {
    func setupChildCoordinator(_ coordinator: Coordinator) {
        coordinator.start()
        childCoordinators.append(coordinator)
        window?.rootViewController = coordinator.rootViewController
    }
}
