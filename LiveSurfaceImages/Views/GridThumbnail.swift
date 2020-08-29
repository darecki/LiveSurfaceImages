//
//  GridThumbnail.swift
//  LiveSurface
//
//  Created by Dariusz Ciesla on 29/08/2020.
//

import SwiftUI

struct GridThumbnail: View, Hashable {
    let imageData: Image

    var body: some View {
        Text("Item \(imageData.index)")
    }
}

struct GridThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        GridThumbnail(imageData: Image(index: 1))
    }
}