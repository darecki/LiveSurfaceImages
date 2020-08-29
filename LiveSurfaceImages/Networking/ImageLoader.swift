//
//  ImageLoader.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    var task: URLSessionDataTask?
    @Published var data: Data? = nil

    init(_ url: URL) {
        do {
            data = try Cache.load(url: url)
            return
        } catch {
            print("Nothing in cache")
        }

        print("Downloading image \(url)")
        task = URLSession.shared.dataTask(with: url) { data, _, _ in
            print("Finished image \(url)")
            DispatchQueue.main.async {
                self.data = data

                if let data = data {
                    do {
                        try Cache.save(data: data, url: url)
                    } catch {
                        print("Couldn't save into cache")
                    }

                }
            }
        }
        task?.resume()
    }
    deinit {
        task?.cancel()
    }
}
