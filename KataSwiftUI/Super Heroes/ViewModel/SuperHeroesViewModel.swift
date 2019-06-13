//
//  SuperHeroesViewModel.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 11/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SuperHeroesViewModel: BindableObject {
    let didChange = PassthroughSubject<SuperHeroesViewModel, Never>()

    var isLoading = true {
        didSet {
            didChange.send(self)
        }
    }

    var superHeroes: [SuperHero] = [] {
        didSet {
            didChange.send(self)
        }
    }

    private let getSuperHeroes: GetSuperHeroes

    init(getSuperHeroes: GetSuperHeroes) {
        self.getSuperHeroes = getSuperHeroes
    }

    func load() {
        isLoading = true
        getSuperHeroes.execute { superHeroes in
            self.superHeroes = superHeroes
            self.isLoading = false
        }
    }
}
