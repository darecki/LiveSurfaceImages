//
//  ImagesResponse.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation

struct ImagesResponse: Decodable {
    let images: [String: Image]

    enum CodingKeys: String, CodingKey {
        case images = "images"
    }
}
