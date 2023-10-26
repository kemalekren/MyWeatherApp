//
//  UINavigationController+Extension.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import UIKit

extension UINavigationController {
    func pushViewController(_ routes: ViewControllerRoutes?, animated: Bool) {
        guard let viewController = routes?.viewController else { return }
        pushViewController(viewController, animated: animated)
    }

    func presentViewController(_ routes: ViewControllerRoutes?, animated: Bool, completion: (() -> Void)? = nil) {
        guard let viewController = routes?.viewController else { return }
        let navController = UINavigationController(rootViewController: viewController)
        present(navController, animated: animated, completion: completion)
    }

    func setViewControllers(_ routes: [ViewControllerRoutes?], animated: Bool) {
        setViewControllers(routes.compactMap { $0?.viewController }, animated: animated)
    }
}
