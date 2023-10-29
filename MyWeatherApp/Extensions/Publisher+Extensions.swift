//
//  Publisher+Extensions.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Combine

extension Publisher {

    /// - Returns:  A single cancellable only with receiveValue sink function.
    func sink() -> AnyCancellable {
        sink(receiveCompletion: { _ in }, receiveValue: { _ in })
    }
}
