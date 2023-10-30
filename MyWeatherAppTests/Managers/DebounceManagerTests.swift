//
//  DebounceManagerTests.swift
//  MyWeatherAppTests
//
//  Created by Esat Kemal Ekren on 30/10/2023.
//

import XCTest
@testable import MyWeatherApp

final class DebounceManagerTests: XCTestCase {

    var sut: DebounceManager!

    override func setUp() {
        super.setUp()
        sut = DebounceManager()
    }

    override func tearDown() {
        sut = nil
    }

    func test_debounce() {
        // given:
        var actionCount = 0

        let action = {
            actionCount += 1
        }

        // when:
        sut.debounce(action: action)
        sut.debounce(action: action)
        sut.debounce(action: action)

        let expectation = XCTestExpectation(description: "Debounce completed")
        DispatchQueue.global().asyncAfter(deadline: .now() + sut.debounceDuration + 0.1) {
            expectation.fulfill()
        }

        // Wait for the expectation
        wait(for: [expectation], timeout: 1.0)

        // then:
        XCTAssertEqual(actionCount, 1)
    }

    func test_debounce_with_delay() {
        // given:
        var actionCount = 0

        let action = {
            actionCount += 1
        }

        // when:
        sut.debounce(action: action)
        
        let expectation = XCTestExpectation(description: "Debounce completed")
        DispatchQueue.global().asyncAfter(deadline: .now() + sut.debounceDuration + 0.1) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)

        // then:
        XCTAssertEqual(actionCount, 1)
    }

}
