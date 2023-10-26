//
//  HomeViewModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI
import Combine

protocol HomeViewModelProtocol: AnyObject {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>? { get set }
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>?
    
    @Published var viewState: HomeViewState = .initial
    
    let repository: HomeAppRepositoryProtocol
    
    init(repository: HomeAppRepositoryProtocol) {
        self.repository = repository
        makeAPICAll()
    }
}

private extension HomeViewModel {
    func makeAPICAll() {
        viewState = .loading
        let requestModel = HomeRequestModel(lat: "44.34", lon: "10.99", cityName: nil)
        repository.getWeatherData(with: requestModel)
            .map { [weak self] response in
                print("LLL \(response)")
                return HomeViewState.loaded
            }
            .catch {
                print("LLL \($0)")
                return Just(HomeViewState.error($0))
            }
            .assign(to: &$viewState)
    }
}
