//
//  SearchScene.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI

struct SearchScene: View {
    @StateObject var viewModel: SearchViewModel
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                if searchText.isEmpty {
                    SearchEmptyView()
                } else {
                    if isLoading {
                        LoadingView(color: .black)
                    } else {
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 0) {
                                if !data.isEmpty {
                                    ForEach(Array(data.enumerated()), id: \.1) { index, model in
                                        Button {
                                            viewModel.saveSelectedCity(with: model)
                                        } label: {
                                            HStack {
                                                Text(model.name)
                                                    .font(.callout)
                                                    .foregroundStyle(.black)
                                                    .frame(height: 40)
                                                    .padding(.horizontal, 16)
                                                Spacer()
                                                Text(L10n.SearchScreen.Button.Select.title)
                                                    .font(.callout)
                                                    .foregroundStyle(Color.accentColor)
                                                    .frame(height: 40)
                                                    .padding(.horizontal, 16)
                                            }
                                        }
                                        .contentShape(Rectangle())

                                        if (index != data.count - 1) {
                                            Divider()
                                                .frame(height: 1)
                                                .background(.gray.opacity(0.5))
                                                .padding(.horizontal, 16)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(L10n.SearchScreen.NavigationBar.title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.onNavigate(to: .back)
                    } label: {
                        Image(systemName: "chevron.left")
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(side: 24)
                    }
                }
            }
            .onChange(of: searchText) {newValue in
                viewModel.searchCity(with: newValue)
            }
            .searchable(text: $searchText)
        }
    }
}

private extension SearchScene {
    var data: [SearchModel] {
        switch viewModel.viewState {
        case .loaded(let model):
            return model
        default:
            return []
        }
    }
    
    var isLoading: Bool {
        return viewModel.viewState == .loading
    }
}

//#Preview {
//    SearchScene()
//}
