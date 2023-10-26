//
//  HomeDetailView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

struct HomeDetailView: View {
    let columnSizes: [GridItem] = [
           GridItem(.flexible(), spacing: 0)
       ]
    
    var body: some View {
        GeometryReader { proxy in
            LazyVGrid(columns: columnSizes, spacing: 0) {
                Section("") {
                    createWindView()
                }
                Section("") {
                    HStack(alignment: .center, spacing: 0) {
                        createOneValueField()

                        createOneValueField()
                    }
                }
                Section("") {
                    HStack(alignment: .center, spacing: 0) {
                        createOneValueField()

                        createOneValueField()
                    }
                }
                Section("") {
                    HStack(alignment: .center, spacing: 0) {
                        sunView()

                        createOneValueField()
                    }
                }
            }
        }
    }
}

private extension HomeDetailView {
    @ViewBuilder
    func createWindView() -> some View {
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
                    Text("0.62 m/s")
                        .frame(height: 40)
                        .padding(.top, 16)
                        .foregroundStyle(.white)
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                    Text("1.18 m/s")
                        .frame(height: 40)
                        .padding(.bottom, 16)
                        .foregroundStyle(.white)
                }
                
              CircleView()
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
    func createOneValueField() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "thermometer.medium")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white)
                Text("Feels Like")
                    .font(.body)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            Text("11°")
                .font(.largeTitle)
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .foregroundStyle(.white)
            Spacer()
        }
        .frame(height: 100)
        .background(.white.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func sunView() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "sunrise")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundStyle(.white)
                    
                    Text("9:00")
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
                    
                    Text("19:00")
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

#Preview {
    HomeDetailView()
}

struct CircleView: View {
    let circleSize: CGFloat = 100
    let arrowSize: CGFloat = 20
    let arrowPadding: CGFloat = 10
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.3),lineWidth: 5)
                .frame(width: circleSize, height: circleSize)
            
            Image(systemName: "location.north.line.fill")
                .resizable()
                .frame(width: arrowSize, height: arrowSize)
                .position(x: circleSize / 2, y: circleSize / 2)
                .rotationEffect(.degrees(23), anchor: .center)
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
