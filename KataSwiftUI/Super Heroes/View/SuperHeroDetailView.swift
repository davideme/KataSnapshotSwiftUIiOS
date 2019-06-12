
//
//  SuperHeroDetailPresenter.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 11/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import SwiftUI

struct SuperHeroDetailView : View {
    let item: SuperHero

    @State
    var heroImage: Image? = nil

    var body: some View {
        return VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                heroImage?
                    .resizable()
                    .aspectRatio(1.7769376181, contentMode: .fill)
                    .relativeWidth(1.0)
                    .clipped()
                if item.isAvenger {
                    Image("ic_avenger_badge")
                        .padding()
                }
            }
            Text(item.name).color(.white).padding()
            Text(item.description).color(.white).lineLimit(nil).padding()
            Spacer()
        }
        .background(Color("backgroundColor"))
        .onReceive(loadImage(url: item.photo)) { newHeroImage in
            DispatchQueue.main.async {
                self.heroImage = newHeroImage
            }
        }
    }
}
#if DEBUG
//struct SuperHeroDetailView_Previews : PreviewProvider {
//    static var previews: some View {
//        SuperHeroDetailView()
//    }
//}
#endif

