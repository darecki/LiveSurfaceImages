//
//  ImagesRequest.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum ImagesRequest {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://www.livesurface.com/test/api/")!
}

enum APIPath {
    case imageList

    var path: String {
        switch self {
        case .imageList: return "images.php"
        }
    }
}

extension ImagesRequest {

    static func request(_ path: APIPath) -> AnyPublisher<ImagesResponse, Error> {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [
            URLQueryItem(name: "key", value: "79319da5-8cb3-43ac-f5b0-f38a727242a8"),
//            URLQueryItem(name: "pro", value: "1")
        ]

        let request = URLRequest(url: components.url!)

        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
