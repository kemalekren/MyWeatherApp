//
//  HomeHeaderView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                Text("Poznan")
                    .font(.title.bold())
                    .padding(.top, 16)
                    .foregroundStyle(.white)
                
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "cloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                    
                    Text("16")
                        .padding(.horizontal, 16)
                        .font(.title2)
                        .foregroundStyle(.white)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("H: 20")
                            .padding(.horizontal, 16)
                            .font(.callout)
                            .foregroundStyle(.white)
                        Text("L: 10")
                            .padding(.horizontal, 16)
                            .font(.callout)
                            .foregroundStyle(.white)
                    }
                }
                
                Text("Partially Cloudy")
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.3))
            .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 16)
            
        }
    }
}

#Preview {
    HomeHeaderView()
}
