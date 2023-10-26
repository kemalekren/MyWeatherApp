//
//  HomeViewModel.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

protocol HomeViewModelProtocol: AnyObject {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>? { get set }
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>?
}
