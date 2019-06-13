//
//  SuperHeroesViewTests.swift
//  KataSwiftUITests
//
//  Created by Davide Mendolia on 13/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting
@testable import KataSwiftUI

class SuperHeroesViewControllerTests: SnapshotTestCase {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsEmptyCase() {
        givenThereAreNoSuperHeroes()

        let view = getSuperHeroListView()

        verify(view: view)
    }

    func testShowsOneSuperHeroes() {
        let _ = givenThereAreSomeSuperHeroes(1)

        let view = getSuperHeroListView()

        verify(view: view)
    }

    func testShowsSuperHeroesWithoutBadges() {
        let _ = givenThereAreSomeSuperHeroes()

        let view = getSuperHeroListView()

        verify(view: view)
    }

    func testShowsSuperHeroesWithBadges() {
        let _ = givenThereAreSomeAvengers()

        let view = getSuperHeroListView()

        verify(view: view)
    }

    fileprivate func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    fileprivate func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    fileprivate func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
                                                  avengers: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                photo: URL(string: ""),
                isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func getSuperHeroListView() -> some View {
        let viewModel = SuperHeroesViewModel(getSuperHeroes: GetSuperHeroes(repository: repository))
        return SuperHeroesList(viewModel: viewModel)
    }
}
