//
//  ContentView.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 10/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import SwiftUI
import SDWebImage
import Combine

class ImageLoader: BindableObject {
    var didChange = PassthroughSubject<Image?, Never>()

    var image: Image? = nil {
        didSet {
            if oldValue != image {
            }
        }
    }

    func load(url: URL?) -> Self {
        guard image == nil else {
            return self
        }

        SDWebImageManager.shared.loadImage(with: url, progress: nil) { (uiimage, _, _, _, _, _) in
            self.image = uiimage.map { Image(uiImage: $0) }
        }
        return self
    }
}

func loadImage(url: URL?) ->  Publishers.Future<Image?, Never>{
    return Publishers.Future { fullfill in
        SDWebImageManager.shared.loadImage(with: url, progress: nil) { (uiimage, _, _, _, _, _) in
            fullfill(Result<Image?, Never>.success(uiimage.map { Image(uiImage: $0) }))
        }
    }
}

struct SuperHeroesViewCell : View {
    let item: SuperHero

    @State
    var background: Image? = nil

    var body: some View {
        return ZStack(alignment: .bottom) {
            background?
                .resizable()
                .aspectRatio(1.7769376181, contentMode: .fill)
                .relativeHeight(1.0)
                .clipped()
            gradient()
            HStack(alignment: .bottom) {
                Text(item.name).color(.white).font(.system(size: 16.0)).padding()
                Spacer()
                if item.isAvenger {
                    Image("ic_avenger_badge")
                        .padding()
                }
            }.relativeWidth(1.0)
        }
        .frame(height: 163)
        .onReceive(loadImage(url: item.photo)) { newBackground in
            DispatchQueue.main.async {
                self.background = newBackground
            }
        }
    }

    private func gradient() -> some View {
        let gradient = LinearGradient(
            gradient: .init(colors: [Color("gradientStartColor"), Color("gradientEndColor")]),
            startPoint: .init(x: 0.0, y: 0.6),
            endPoint: .init(x: 0.0, y: 1.0)
        )
        return Rectangle().fill(gradient)
    }
}



#if DEBUG
private let s = SuperHero(name: "Scarlet Witch",
          photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/b0/537bc2375dfb9.jpg"),
          isAvenger: true,
          description: "Scarlet Witch was born at the Wundagore base of the High Evolutionary, she and her twin "
            + "brother Pietro were the children of Romani couple Django and Marya Maximoff. The "
            + "High Evolutionary supposedly abducted the twins when they were babies and "
            + "experimented on them, once he was disgusted with the results, he returned them to"
            + " Wundagore, disguised as regular mutants.")

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        SuperHeroesViewCell(item: s)
    }
}
#endif
