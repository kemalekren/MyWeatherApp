//
//  HomeHeaderView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI
import Kingfisher

fileprivate enum HomeHeaderViewConstant {
    static let imageBaseURL = "https://openweathermap.org/img/wn/"
}

struct HomeHeaderView: View {
    var headerModel: HomeWeatherModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                Text(headerModel.cityName)
                    .font(.title.bold())
                    .padding(.top, 16)
                    .foregroundStyle(.white)
                
                HStack(alignment: .center, spacing: 5) {
                    KFImage(imageURL)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white)
                    
                    Text("\(headerModel.temprature) °")
                        .padding(.horizontal, 16)
                        .font(.title2)
                        .foregroundStyle(.white)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("H: \(headerModel.maxTemprature) °")
                            .padding(.horizontal, 16)
                            .font(.callout)
                            .foregroundStyle(.white)
                        Text("L: \(headerModel.minTemprature) °")
                            .padding(.horizontal, 16)
                            .font(.callout)
                            .foregroundStyle(.white)
                    }
                }
                
                Text(headerModel.weatherDescription)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.3))
            .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 8)
            
        }
    }
}

private extension HomeHeaderView {
    var imageURL: URL? {
        let url = "\(HomeHeaderViewConstant.imageBaseURL)\(headerModel.weatherIconURL)@2x.png"
        return URL(string: url)
    }
}



//#Preview {
//    HomeHeaderView()
//}
