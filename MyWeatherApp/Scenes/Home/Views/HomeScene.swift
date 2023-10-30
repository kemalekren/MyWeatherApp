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
        ZStack(alignment: .center) {
            LinearGradient(colors: [Asset.Colors.homeDarkBlue.swiftUIColor, Asset.Colors.homeLightBlue.swiftUIColor], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            if isLoading {
                LoadingView()
            } else {
                
                VStack(alignment: .center, spacing: 10) {
                    header()
                    
                    Spacer()
                    
                    if let error = isErrorLoaded, !error.isEmpty {
                        ErrorView(errorMessage: error)
                            .frame(height: 100)
                            .padding(.horizontal, 16)
                        Spacer()
                    } else {
                        ScrollView {
                            VStack {
                                if let weatherData = weatherData {
                                    HomeHeaderView(headerModel: weatherData.weather)
                                        .padding(.top, 16)
                                    
                                    HomeDetailView(homeDetailModel: weatherData.weatherDetails)
                                    Spacer()
                                }
                            }
                            
                        }
                        Spacer()
                       
                            if let weatherData = weatherData {
                                HStack(alignment: .center) {
                                Text("Updated time: \(weatherData.weather.updatedTime)")
                                    .foregroundStyle(.white)
                                Button { 
                                    viewModel.requestWeatherData(with: viewModel.currentUnitType)
                                    
                                } label: {
                                    Image(systemName: "arrow.clockwise")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(side: 20)
                                        .foregroundStyle(.white)
                                }
                            }
                                .frame(height: 20)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                   
                        
                    }
                }
            }
                
        }
        .onAppear {
            viewModel.requestLocationPermission()
        }
    }
}

private extension HomeScene {
    @ViewBuilder
    func header() -> some View {
        HStack(alignment: .center, spacing: 10) {
            Menu {
                Button {
                    viewModel.getmYlocation()
                }label: {
                    Label("My Location", image: "")
                }
                
                Button {
                    viewModel.requestWeatherData(with: .fahrenheit)
                }label: {
                    Label(L10n.HomeScreen.Settings.Fahrenheit.title, image: Asset.Images.Home.fahrenheitIcon.name)
                        .tint(Asset.Colors.searchTextColor.swiftUIColor)
                }
                
                Button {
                    viewModel.requestWeatherData(with: .metric)
                }label: {
                    Label(L10n.HomeScreen.Settings.Celsius.title, image: Asset.Images.Home.celsiusIcon.name)
                        .tint(Asset.Colors.searchTextColor.swiftUIColor)
                    
                }
            } label: {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .frame(side: 20)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            Button {
                viewModel.navigate(to: .search)
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(side: 20)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 16)
    }
}

private extension HomeScene {
    var weatherData: HomeWeatherMainModel? {
        switch viewModel.viewState {
        case .loaded(let model):
            return model
        default:
            return nil
        }
    }
    
    var isLoading: Bool {
        return viewModel.viewState == .loading
    }
    
    var isErrorLoaded: String? {
        if case let .error(error) = viewModel.viewState {
            return error.localizedDescription
        }
        
        return nil
    }
}

//#Preview {
//    HomeScene()
//}
