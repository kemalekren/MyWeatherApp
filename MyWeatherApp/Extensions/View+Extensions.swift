//
//  View+Extensions.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI

extension View {
    func frame(side: CGFloat) -> some View {
        frame(width: side, height: side)
    }
}
