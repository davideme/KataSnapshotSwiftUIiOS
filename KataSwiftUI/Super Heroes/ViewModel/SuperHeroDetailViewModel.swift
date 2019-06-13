//
//  SuperHeroDetailViewModel.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 13/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SuperHeroDetailViewModel: BindableObject {
    let didChange = PassthroughSubject<SuperHeroDetailViewModel, Never>()

    private let superHeroName: String
    private let getSuperHeroByName: GetSuperHeroByName

    var isLoading = true {
        didSet {
            didChange.send(self)
        }
    }

    var superHero: SuperHero? = nil {
        didSet {
            didChange.send(self)
        }
    }

    let title: String

    init(superHeroName: String, getSuperHeroByName: GetSuperHeroByName) {
        self.superHeroName = superHeroName
        self.getSuperHeroByName = getSuperHeroByName
        title = superHeroName
    }

    func load() {
        isLoading = true
        getSuperHeroByName.execute(superHeroName) { superHero in
            self.isLoading = false
            self.superHero = superHero
        }
    }

}
