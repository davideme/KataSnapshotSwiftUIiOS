//
//  RootWireframe.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ServiceLocator {

    static let shared = ServiceLocator()

    func provideRootViewController() -> UIViewController {
        return provideSuperHeroesViewController()
    }

    func provideSuperHeroesViewController() -> UIViewController {
        let viewModel = provideSuperHeroesViewModel()
        return UIHostingController(rootView: SuperHeroesList(viewModel: viewModel))
    }


    func provideSuperHeroDetailView(_ superHeroName: String) -> SuperHeroDetailView {
//        viewController.presenter = provideSuperHeroDetailPresenter(viewController, superHeroName: superHeroName)
        return SuperHeroDetailView(item: sh)
    }
//
//    func provideSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
//        let viewController: SuperHeroDetailViewController =
//        storyBoard.instantiateViewController("SuperHeroDetailViewController")
//        viewController.presenter = provideSuperHeroDetailPresenter(viewController, superHeroName: superHeroName)
//        return viewController
//    }
//
//    fileprivate func provideSuperHeroDetailPresenter(_ ui: SuperHeroDetailUI,
//        superHeroName: String) -> SuperHeroDetailPresenter {
//        let getSuperHeroByName = GetSuperHeroByName(repository: SuperHeroesRepository())
//        return SuperHeroDetailPresenter(ui: ui, superHeroName: superHeroName, getSuperHeroByName: getSuperHeroByName)
//    }
//
//    fileprivate func provideSuperHeroesDataSource() -> SuperHeroesTableDataSource {
//        return SuperHeroesTableDataSource()
//    }
//
//    fileprivate func provideSuperHeroesPresenter(_ ui: SuperHeroesUI) -> SuperHeroesPresenter {
//        let getSuperHeroes = provideGetSuperHeroesUseCase()
//        return SuperHeroesPresenter(ui: ui, getSuperHeroes: getSuperHeroes)
//    }

    private func provideSuperHeroesViewModel() -> SuperHeroesViewModel {
        let getSuperHeroes = provideGetSuperHeroesUseCase()
        return SuperHeroesViewModel(getSuperHeroes: getSuperHeroes)
    }

    fileprivate func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        return GetSuperHeroes(repository: SuperHeroesRepository())
    }

    fileprivate lazy var storyBoard: KataSuperHeroesStoryboard = {
        return KataSuperHeroesStoryboard(name: "SuperHeroes")
    }()
}
