//
//  SearchVC.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 29/10/2023.
//

import SwiftUI

final class SearchVC<Content>: UIHostingController<Content> where Content: View {
    /// Home VC Navigation Event Handler
    var navigationEventHandler: CustomHandler<SearchNavigationEvent>?

    /// AccountVC ViewModel
    private unowned var viewModel: SearchViewModelProtocol

    /// A default ViewController initializer.
    ///
    /// - Parameters:
    ///   - view: a SwiftUI view.
    required init(rootView: Content, viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
        setupHandlers()
    }

    @available(*, unavailable)
    dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle events

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

private extension SearchVC {

    func setupHandlers() {
        viewModel.navigationEventHandler = { [weak self] event in
            self?.navigationEventHandler?(event)
        }
    }
}

extension SearchVC: SearchSceneRoutes {}

