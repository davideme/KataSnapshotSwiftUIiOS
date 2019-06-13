//
//  SuperHeroDetailViewTests.swift
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

class SuperHeroDetailViewControllerTests: SnapshotTestCase {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsSuperHeroWithNoBadge() {
        let superHero = givenASuperHero(isAvenger: false)

        let view = getSuperHeroDetailView(superHero.name)

        verify(view: view)
    }

    func testShowsSuperHeroWithBadge() {
        let superHero = givenASuperHero(isAvenger: true)

        let view = getSuperHeroDetailView(superHero.name)

        verify(view: view)
    }

    func givenASuperHero(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }

    fileprivate func getSuperHeroDetailView(_ superHeroName: String) -> some View {
        let getSuperHeroByName = GetSuperHeroByName(repository: repository)
        let viewModel = SuperHeroDetailViewModel(superHeroName: superHeroName, getSuperHeroByName: getSuperHeroByName)
        let superHeroDetail = SuperHeroDetailView(viewModel: viewModel)

        return superHeroDetail
    }
}
