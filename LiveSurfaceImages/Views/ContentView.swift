//
//  ContentView.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let items = (1...1000)
        .map(Image.init)

    var body: some View {
        ScrollView {
            GridView(columns: 3, list: items) { item in
                GridThumbnail(imageData: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
