//
//  Cache.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation

enum Cache {
    static func fileURL(for imageURL: URL) -> URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent(imageURL.lastPathComponent)
    }

    static func save(data: Data, url: URL) throws {
        try data.write(to: fileURL(for: url))
    }

    static func load(url: URL) throws -> Data {
        return try Data(contentsOf: fileURL(for: url))
    }
}
