//
//  BaseBuilder.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Swinject

class BaseBuilder {
    unowned let container: Container
    
    init(container: Container) {
        self.container = container
    }
}
