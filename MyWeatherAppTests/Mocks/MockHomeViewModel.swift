//
//  MockHomeViewModel.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation
@testable import MyWeatherApp

final class MockHomeViewModel: HomeViewModelProtocol {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>?
    
    func navigate(to route: HomeNavigationEvent) {
        
    }
    
    func requestWeatherData(with unit: HomeUnitTypes) {
        
    }

}
