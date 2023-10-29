//
//  HomeDetailView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

struct HomeDetailView: View {
    var homeDetailModel: HomeWeatherDetailModel
    
    let columnSizes: [GridItem] = [
           GridItem(.flexible(), spacing: 0)
       ]
    
    var body: some View {
        GeometryReader { proxy in
            LazyVGrid(columns: columnSizes, spacing: 0) {
                Section("") {
                    createWindView(imageURL: "", 
                                   speed: homeDetailModel.windSpeed, 
                                   gust: homeDetailModel.windGust,
                                   degree: homeDetailModel.windDegree
                    )
                }
                Section("") {
                    HStack(alignment: .center, spacing: 0) {
                        createOneValueField(temprature: "\(homeDetailModel.feelsLike)", title: "Feels Like")

                        createOneValueField(temprature: "\(homeDetailModel.humidity)", title: "Humidity")
                    }
                }
                Section("") {
                    HStack(alignment: .center, spacing: 0) {
                        createOneValueField(temprature: homeDetailModel.pressure, title: "Pressure")

                        createOneValueField(temprature: homeDetailModel.visibility, title: "Visibility", isDegree: false)
                    }
                }
                Section("") {
                    HStack(alignment: .center, spacing: 0) {
                        sunView(sunSet: homeDetailModel.sunSetTime, sunRise: homeDetailModel.sunRiseTime)
                    }
                }
            }
        }
    }
}

private extension HomeDetailView {
    @ViewBuilder
    func createWindView(imageURL: String, speed: String, gust: String?, degree: Double) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "wind")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.white)
                
                Text("Wind")
                    .font(.body)
                    .foregroundStyle(.white)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            HStack(alignment: .center, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(speed) m/s")
                        .frame(height: 40)
                        .padding(.top, 16)
                        .foregroundStyle(.white)
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                    if let gust = gust {
                        Text("\(gust) m/s")
                            .frame(height: 40)
                            .padding(.bottom, 16)
                            .foregroundStyle(.white)
                    }
                }
                
                CircleView(degree: degree)
                    .frame(width: 100, height: 100)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .frame(height: 150)
        .background(Color.white.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func createOneValueField(temprature: String, title: String, isDegree: Bool = true) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "thermometer.medium")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white)
                Text(title)
                    .font(.body)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            if isDegree {
                Text("\(temprature)°")
                    .font(.largeTitle)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .foregroundStyle(.white)
            } else {
                Text("\(temprature) km")
                    .font(.largeTitle)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .foregroundStyle(.white)
            }
           
            Spacer()
        }
        .frame(height: 100)
        .background(.white.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func sunView(sunSet: String, sunRise: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "sunrise")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundStyle(.white)
                    
                    Text(sunRise)
                        .font(.body)
                        .foregroundStyle(.white)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "sunset")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundStyle(.white)
                    
                    Text(sunSet)
                        .font(.body)
                        .foregroundStyle(.white)
                }
                .padding(.trailing, 16)
            }
            Text("Sun rise and Sun Set")
                .font(.caption2)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
        .background(.white.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
}
//
//#Preview {
//    HomeDetailView()
//}

struct CircleView: View {
    let circleSize: CGFloat = 100
    let arrowSize: CGFloat = 20
    let arrowPadding: CGFloat = 10
    var degree: Double = 0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.3),lineWidth: 5)
                .frame(width: circleSize, height: circleSize)
            
            Image(systemName: "location.north.line.fill")
                .resizable()
                .frame(width: arrowSize, height: arrowSize)
                .position(x: circleSize / 2, y: circleSize / 2)
                .rotationEffect(.degrees(degree), anchor: .center)
                .foregroundStyle(.white)
            
            Text("N")
                .position(x: circleSize / 2, y: (circleSize / 2) - (circleSize / 2) + arrowPadding)
                .foregroundStyle(.white)
            
            Text("S")
                .position(x: circleSize / 2, y: (circleSize / 2) + (circleSize / 2) - arrowPadding)
                .foregroundStyle(.white)
            
            Text("W")
                .position(x: (circleSize / 2) - (circleSize / 2) + arrowPadding, y: circleSize / 2)
                .foregroundStyle(.white)
            
            Text("E")
                .position(x: (circleSize / 2) + (circleSize / 2) - arrowPadding, y: circleSize / 2)
                .foregroundStyle(.white)
        }
    }
}
