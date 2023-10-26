//
//  AppDelegate.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 25/10/2023.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let container = Container()
    
    lazy var appCoordinator: AppCoordinator = AppCoordinator(window: window, container: container)
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.makeKeyAndVisible()
        AppContainer.build(in: container)
        appCoordinator.start()
        
        return true
    }
}

