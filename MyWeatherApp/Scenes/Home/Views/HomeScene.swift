//
//  HomeScene.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("customBlue"), Color("lightblue")], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack {
                        HomeHeaderView()
                            .padding(.top, 16)
                        
                        HomeDetailView()
                        Spacer()
                    }
                    
                }
                Spacer()
                Text("Updated time: 10.20.2023 23:33")
                    .foregroundStyle(.white)
            }
        }
    }
}

//#Preview {
//    HomeScene()
//}
