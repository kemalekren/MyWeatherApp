//
//  HomeViewSnapshotTests.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import XCTest
@testable import MyWeatherApp
import SwiftUI
import SnapshotTesting

final class HomeViewSnapshotTests: XCTestCase {

    func testHomeDetailScene() {
        // given:
        let view = HomeDetailView(homeDetailModel: PreviewMocks.mockHomeWeatherDetailModel)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        // then:
        assertSnapshot(matching: vc, as: .image)
    }
    
    func testHomeHeaderView() {
        // given:
        let view = HomeHeaderView(headerModel: PreviewMocks.mockHomeWeatherModel)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        // then:
        assertSnapshot(matching: vc, as: .image)
    }
    
    func testHomeView() {
        // given:
        let mockLocationManager = MockLocationManager()
        let mockUserManager = MockUserManager()
        let homeRepository = MockHomeAppRepository(mockResultModel: MockHomeResultModel())
        let viewModel = HomeViewModel(
            repository: homeRepository,
            locationManager: mockLocationManager,
            userManager: mockUserManager
        )
        // when:
        viewModel.viewState = .loaded(PreviewMocks.mockHomeWeatherMainModel)
        let view = HomeScene(viewModel: viewModel)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        // then:
        assertSnapshot(matching: vc, as: .image)
    }
}
