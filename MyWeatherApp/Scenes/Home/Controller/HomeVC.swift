//
//  HomeVC.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import SwiftUI

final class HomeVC<Content>: UIHostingController<Content> where Content: View {
    /// Home VC Navigation Event Handler
    var navigationEventHandler: CustomHandler<HomeNavigationEvent>?

    /// AccountVC ViewModel
    private unowned var viewModel: HomeViewModelProtocol

    /// A default ViewController initializer.
    ///
    /// - Parameters:
    ///   - view: a SwiftUI view.
    required init(rootView: Content, viewModel: HomeViewModelProtocol) {
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

private extension HomeVC {

    func setupHandlers() {
        viewModel.navigationEventHandler = { [weak self] event in
            self?.navigationEventHandler?(event)
        }
    }
}

extension HomeVC: HomeSceneRoutes {}
