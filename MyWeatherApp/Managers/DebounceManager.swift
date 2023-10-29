//
//  DebounceManager.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import Foundation

protocol DebounceManagerProcotol {
    func debounce(action: @escaping ()->())
}


final class DebounceManager: DebounceManagerProcotol {

    private var timer: Timer?
    let debounceDuration: TimeInterval = 0.5
    
    func debounce(action: @escaping ()->()) {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: debounceDuration, repeats: false) { _ in
            action()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
