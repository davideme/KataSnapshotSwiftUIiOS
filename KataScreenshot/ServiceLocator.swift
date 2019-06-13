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
        let viewModel = provideSuperHeroDetailViewModel(superHeroName: superHeroName)
        return SuperHeroDetailView(viewModel: viewModel)
    }

    fileprivate func provideSuperHeroDetailViewModel(superHeroName: String) -> SuperHeroDetailViewModel {
        let getSuperHeroByName = GetSuperHeroByName(repository: SuperHeroesRepository())
        return SuperHeroDetailViewModel(superHeroName: superHeroName, getSuperHeroByName: getSuperHeroByName)
    }

    private func provideSuperHeroesViewModel() -> SuperHeroesViewModel {
        let getSuperHeroes = provideGetSuperHeroesUseCase()
        return SuperHeroesViewModel(getSuperHeroes: getSuperHeroes)
    }

    fileprivate func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        return GetSuperHeroes(repository: SuperHeroesRepository())
    }
}
