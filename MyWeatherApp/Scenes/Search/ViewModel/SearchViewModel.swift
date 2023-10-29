//
//  SearchViewModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI
import Combine

fileprivate enum SearchViewModelConstants {
    static let responseLimit = "5"
}

protocol SearchViewModelProtocol: AnyObject {
    var navigationEventHandler: CustomHandler<SearchNavigationEvent>? { get set }
   
    func onNavigate(to route: SearchNavigationEvent)
    
    func searchCity(with name: String)
    
    func saveSelectedCity(with city: SearchModel)
}

final class SearchViewModel: ObservableObject, SearchViewModelProtocol {
    var navigationEventHandler: CustomHandler<SearchNavigationEvent>?
    
    @Published var viewState: SearchViewState = .initial
    
    private let repository: SearchAppRepositoryProtocol
    private let debounceManager: DebounceManagerProcotol
    private let userManager: UserManager
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: SearchAppRepositoryProtocol, debounceManager: DebounceManagerProcotol, userManager: UserManager) {
        self.repository = repository
        self.debounceManager = debounceManager
        self.userManager = userManager
    }
    
    func onNavigate(to route: SearchNavigationEvent) {
        navigationEventHandler?(route)
    }
    
    func saveSelectedCity(with city: SearchModel) {
        userManager.saveCitySelection(cityDetails: city)
            .sink()
            .store(in: &cancellables)
        onNavigate(to: .select)
    }
    
    func searchCity(with name: String) {
        self.viewState = .loading
        debounceManager.debounce { [weak self] in
            guard let self = self else {
                return
            }
           
            let requestModel = SearchRequestModel(cityName: name, limit: SearchViewModelConstants.responseLimit)
            
            repository.searchCity(with: requestModel)
                .map { response in
                    let model = response.map(SearchModel.init)
                    return SearchViewState.loaded(model)
                }
                .catch {
                    print("Error: \($0)")
                    return Just(SearchViewState.error($0))
                }
                .assign(to: &$viewState)
        }
    }
}
