//
//  Coordinator.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import UIKit

/// An Abstraction for flow coordinators.
protocol Coordinator: AnyObject {
    /// A root view controller
    var rootViewController: UINavigationController? { get }
    
    /// A collection of child coordinators
    var childCoordinators: [Coordinator] { get }
    
    /// Calls to start flow
    func start()
}
