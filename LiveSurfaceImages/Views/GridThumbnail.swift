//
//  GridThumbnail.swift
//  LiveSurface
//
//  Created by Dariusz Ciesla on 29/08/2020.
//

import SwiftUI
import Combine

struct GridThumbnail: View {
    let imageData: ImageModel

    var imageURL: URL {
        URL(string: "https://www.livesurface.com/test/images/\(imageData.image)")!
    }

    var body: some View {
        VStack {
            Spacer()
            AsyncImage(url: imageURL)
            Spacer()
            Text("\(imageData.name) \(imageData.number)")
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
        .padding()
    }
}
