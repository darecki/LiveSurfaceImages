//
//  AsyncImage.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct AsyncImage: View {
    init(url: URL) {
        self.imageLoader = ImageLoader(url)
    }

    @ObservedObject private var imageLoader: ImageLoader
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }

    var body: some View {
        Image(uiImage: image ?? UIImage())
            .resizable()
            .scaledToFit()
    }
}
