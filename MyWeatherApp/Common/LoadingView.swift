//
//  LoadingView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI

struct LoadingView: View {
    var color: Color = .white
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(2)
            .tint(color)
            .frame(height: 320)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    LoadingView()
}
