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
    @State private var columns: Double = 3

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    GridView(columns: Int(self.columns), list: self.viewModel.images) { item in
                        GridThumbnail(imageData: item)
                    }
                    .frame(width: geometry.size.width)
                }
                Slider(value: self.$columns, in: (1...8))
            }
            .padding()

        }
    }
}
