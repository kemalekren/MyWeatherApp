//
//  SearchEmptyView.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI

struct SearchEmptyView: View {
    var searchText: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(side: 50)
            
            if searchText.isEmpty {
                Text("Please make your search and find your city")
            } else {
                Text("No Result found for \(searchText)")
            }
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    SearchEmptyView(searchText: "")
}
