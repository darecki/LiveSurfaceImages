//
//  ContentView.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ImagesViewModel()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                GridView(columns: 4, list: self.viewModel.images) { item in
                    GridThumbnail(imageData: item)
                }
                .frame(width: geometry.size.width)
            }
        }
    }
}
