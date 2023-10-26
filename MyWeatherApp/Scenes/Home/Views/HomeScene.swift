//
//  HomeScene.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

struct HomeScene: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("customBlue"), Color("lightblue")], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HomeHeaderView()
                        .padding(.top, 16)
                    
                    HomeDetailView()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeScene()
}
