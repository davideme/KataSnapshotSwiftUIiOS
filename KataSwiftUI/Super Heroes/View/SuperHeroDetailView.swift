
//
//  SuperHeroDetailPresenter.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 11/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import SwiftUI

struct SuperHeroDetailView : View {
    @ObjectBinding
    var viewModel: SuperHeroDetailViewModel

    @State
    var heroImage: Image? = nil

    var body: some View {
        return Group {
            if viewModel.isLoading {
                LoadingSwiftView()
            } else {
                IfLet(viewModel.superHero) { (item:SuperHero) in
                    VStack(alignment: .leading) {
                        ZStack(alignment: .bottomTrailing) {
                            self.heroImage?
                                .resizable()
                                .aspectRatio(1.7769376181, contentMode: .fill)
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
                }
            }
            }
            .navigationBarTitle(Text(viewModel.title))
            .background(Color("backgroundColor"))
            .onReceive(loadImage(url: viewModel.superHero?.photo)) { newHeroImage in
                DispatchQueue.main.async {
                    self.heroImage = newHeroImage
                }
            }
            .onAppear {
                self.viewModel.load()
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


struct IfLet<T, Out: View>: View {
    let value: T?
    let produce: (T) -> Out

    init(_ value: T?, produce: @escaping (T) -> Out) {
        self.value = value
        self.produce = produce
    }

    var body: some View {
        Group {
            if value != nil {
                produce(value!)
            }
        }
    }
}

