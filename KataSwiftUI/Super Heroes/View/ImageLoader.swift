//
//  ImageLoader.swift
//  KataSwiftUI
//
//  Created by Davide Mendolia on 12/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import SDWebImage

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
