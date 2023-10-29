//
//  ErrorView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String
    var textColor: Color = .white
    var onClickAction: VoidHandler?
    var onDismissAction: VoidHandler?
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "exclamationmark.square.fill")
                .resizable()
                .scaledToFill()
                .frame(side: 80)
                .foregroundStyle(Asset.Colors.weatherBlue.swiftUIColor)
                .padding(.top, 10)
            
            Text(errorMessage)
                .font(.title2)
                .foregroundStyle(.black)
            
            HStack(alignment: .center, spacing: 10) {
//                Button {
//                    onDismissAction?()
//                } label: {
//                    Text(L10n.HomeScreen.Error.Button.Title.close)
//                        .foregroundStyle(.white)
//                        .frame(height: 40)
//                        .frame(maxWidth: .infinity)
//                        .background(Asset.Colors.weatherBlue.swiftUIColor)
//                        .cornerRadius(10)
//                }
                
                Button {
                    onClickAction?()
                } label: {
                    Text(L10n.HomeScreen.Error.Button.title)
                        .foregroundStyle(.white)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Asset.Colors.weatherBlue.swiftUIColor)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}

#Preview {
    ErrorView(errorMessage: "This is sample Error Message")
}
