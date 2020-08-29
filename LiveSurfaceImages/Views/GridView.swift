//
//  GridView.swift
//  LiveSurface
//
//  Created by Dariusz Ciesla on 29/08/2020.
//

import SwiftUI

struct GridView<Content: View, T: Hashable>: View {
    private let columns: Int
    private var list: [[T]] = []
    private let content: (T) -> Content

    init(columns: Int, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.columns = columns
        self.content = content
        self.setupList(list)
    }

    var body: some View {
        VStack {
            ForEach(0 ..< self.list.count, id: \.self) { i in
                HStack(alignment: .center, spacing: 20) {
                    ForEach(self.list[i], id: \.self) { object in
                        self.content(object)
                            .frame(width: UIScreen.main.bounds.width / CGFloat(self.columns))
                    }
                }
            }
        }
    }

    private mutating func setupList(_ list: [T]) {
        var column = 0
        var columnIndex = 0

        for object in list {
            if columnIndex < self.columns {
                if columnIndex == 0 {
                    self.list.insert([object], at: column)
                    columnIndex += 1
                } else {
                    self.list[column].append(object)
                    columnIndex += 1
                }
            } else {
                column += 1
                self.list.insert([object], at: column)
                columnIndex = 1
            }
        }
    }
}
