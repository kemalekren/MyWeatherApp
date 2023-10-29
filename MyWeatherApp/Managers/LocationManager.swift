//
//  LocationManager.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 27/10/2023.
//

import CoreLocation
import Combine

fileprivate enum LocationPermissionConstant {
    static var locationThresurehold: Int = 10000
}

protocol LocationManager {
    var authorizationStatus: CLAuthorizationStatus { get }
    var locationPublisher: AnyPublisher<CLLocationCoordinate2D, Never> { get }
    func requestLocationPermission()
    func getMylocation()
}

class LocationPermission: NSObject, ObservableObject, LocationManager, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var coordinates: CLLocationCoordinate2D?
    private let locationManager = CLLocationManager()
    private let locationSubject = PassthroughSubject<CLLocationCoordinate2D, Never>()
    private var previousLocation: CLLocation?

    var locationPublisher: AnyPublisher<CLLocationCoordinate2D, Never> {
        return locationSubject.eraseToAnyPublisher()
    }

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func getMylocation() {
        locationManager.requestLocation()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        if previousLocation == nil {
            coordinates = location.coordinate
            locationSubject.send(location.coordinate)
        } else {
            let distance = location.distance(from: previousLocation!)
            if distance >= 10000 {
                coordinates = location.coordinate
                locationSubject.send(location.coordinate)
            }
        }
    }
    
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            // Handle the error here
//            locationSubject.send(completion: .failure(error))
        }
}
