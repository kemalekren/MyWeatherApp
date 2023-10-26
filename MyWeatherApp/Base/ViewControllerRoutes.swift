//
//  ViewControllerRoutes.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import UIKit

protocol ViewControllerRoutes: AnyObject {
    var viewController: UIViewController { get}
}

extension ViewControllerRoutes where Self: UIViewController {
    var viewController: UIViewController { self }
}
