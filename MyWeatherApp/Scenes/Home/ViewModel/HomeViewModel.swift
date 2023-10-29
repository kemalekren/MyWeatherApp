//
//  HomeViewModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI
import Combine
import CoreLocation

enum HomeUnitTypes: String {
    case metric, fahrenheit
}

protocol HomeViewModelProtocol: AnyObject {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>? { get set }
    
    func navigate(to route: HomeNavigationEvent)
    
    func requestWeatherData(with unit: HomeUnitTypes)
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>?
    
    @Published var viewState: HomeViewState = .initial
    private var cancellables = Set<AnyCancellable>()
    private let repository: HomeAppRepositoryProtocol
    @Published private var locationPermission: LocationManager
    private var selectedCity: SearchModel?
    
    
    private let userManager: UserManager
    private var lat: Double = 0.0
    private var long: Double = 0.0
    private var cityName: String?
    private var isMyLocation: Bool = false
    
    var currentUnitType: HomeUnitTypes = .metric
    
    init(repository: HomeAppRepositoryProtocol, locationManager: LocationManager, userManager: UserManager) {
        self.repository = repository
        self.locationPermission = locationManager
        self.userManager = userManager
    
        locationPermission.locationPublisher
            .sink(receiveValue: { [weak self] coordinates in
                if self?.selectedCity != nil {
                    return
                }
                self?.handleLocationUpdate(coordinates)
            })
            .store(in: &cancellables)
    }
    
    func requestLocationPermission() {
        getSelectedCity()
        locationPermission.requestLocationPermission()
    }
    
    func navigate(to route: HomeNavigationEvent) {
        navigationEventHandler?(route)
    }
    
    private func handleLocationUpdate(_ coordinates: CLLocationCoordinate2D) {
        lat = coordinates.latitude
        long = coordinates.longitude
        print("Received location update in view model: \(coordinates.latitude), \(coordinates.longitude)")
        cityName = nil
        requestWeatherData(with: currentUnitType)
    }
    
    func requestWeatherData(with unit: HomeUnitTypes) {
        viewState = .loading
        if let selectedCity = selectedCity {
            lat = selectedCity.latitude
            long = selectedCity.longitude
            cityName = selectedCity.name
        }
        
        let requestModel = HomeRequestModel(lat: "\(lat)", lon: "\(long)", cityName: nil, units: unit.rawValue)
        repository.getWeatherData(with: requestModel)
            .map { [weak self] response in
                guard let self = self else {
                    return HomeViewState.parseError
                }
                
                let homeWeatherModel = HomeWeatherMainModel(response: response, cityName: cityName)
                return HomeViewState.loaded(homeWeatherModel)
            }
            .catch {
                print("Error: \($0)")
                return Just(HomeViewState.error($0))
            }
            .assign(to: &$viewState)
    }
}

private extension HomeViewModel {
    func getSelectedCity() {
        userManager.getCityDetails()
            .sink { [weak self] city in
                guard let self = self else {
                    return
                }
                self.selectedCity = city
                self.requestWeatherData(with: currentUnitType)
            }
            .store(in: &cancellables)
    }
}
