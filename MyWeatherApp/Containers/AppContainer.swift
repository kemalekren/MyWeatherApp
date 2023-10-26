//
//  AppContainer.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Swinject

protocol ContainerBuilder {
    static func build(in container: Container)
}

enum AppContainer {
    static func build(in container: Container) {
        CommonContainer.build(in: container)
    }
}
