//
//  SuperHeroesList.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 11/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import SwiftUI

struct SuperHeroesList : View {
    let superHeroes: [SuperHero]

    var body: some View {
        List(superHeroes.identified(by: \.name)) { superHero in
            SuperHeroesViewCell(item: superHero)
        }
        .navigationBarTitle(Text("Kata Super Heroes"))
    }
}

#if DEBUG
let sh = SuperHero(name: "Scarlet Witch",
                          photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/b0/537bc2375dfb9.jpg"),
                          isAvenger: true,
                          description: "Scarlet Witch was born at the Wundagore base of the High Evolutionary, she and her twin "
                            + "brother Pietro were the children of Romani couple Django and Marya Maximoff. The "
                            + "High Evolutionary supposedly abducted the twins when they were babies and "
                            + "experimented on them, once he was disgusted with the results, he returned them to"
                            + " Wundagore, disguised as regular mutants.")

struct SuperHeroesList_Previews : PreviewProvider {
    static var previews: some View {
        SuperHeroesList(superHeroes: [sh, sh])
    }
}
#endif
