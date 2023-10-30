//
//  MockLocationManager.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import Foundation
@testable import MyWeatherApp
import CoreLocation
import Combine

final class MockLocationManager: LocationManager {
    var authorizationStatus: CLAuthorizationStatus = .authorizedAlways
    let mockLocationObject = PassthroughSubject<CLLocationCoordinate2D, Never>()
    
    var locationPublisher: AnyPublisher<CLLocationCoordinate2D, Never>
    
    init() {
        self.locationPublisher = mockLocationObject.eraseToAnyPublisher()
    }
    
    func requestLocationPermission() {}
    
    func getMylocation() {}

}
