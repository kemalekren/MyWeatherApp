//
//  UserManagerTests.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import XCTest
import Combine
@testable import MyWeatherApp


final class UserManagerTests: XCTestCase {

    var sut: UserManager!

    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        sut = DefaultUserManager()
    }

    func test_save_and_get_selected_city() {
        // given:
        let mockSelectedCity = createMockSelectedCity(longitude: 10, latitude: 20, name: "London")
        // when:
        sut.saveCitySelection(cityDetails: mockSelectedCity)
            .sink()
            .store(in: &cancellables)

        // then:
        sut.getCityDetails()
            .sink { city in
                XCTAssertEqual(city.longitude, mockSelectedCity.longitude)
                XCTAssertEqual(city.latitude, mockSelectedCity.latitude)
                XCTAssertEqual(city.name, mockSelectedCity.name)
            }
            .store(in: &cancellables)
    }
}

extension UserManagerTests {
    func createMockSelectedCity(longitude: Double, latitude: Double, name: String) -> SearchModel {
        SearchModel(longitude: longitude, latitude: latitude, name: name)
    }
}
