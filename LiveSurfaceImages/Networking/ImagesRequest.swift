//
//  ImagesRequest.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation
import Combine

enum ImagesRequest {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://www.livesurface.com/test/")!
}

enum APIPath {
    case imageList
    case imageData(number: String)

    var path: String {
        switch self {
        case .imageList: return "api/images.php"
        case .imageData(let number): return "images/\(number)"
        }
    }
}

extension ImagesRequest {

    static func request(_ path: APIPath) -> AnyPublisher<ImagesResponse, Error> {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "key", value: "79319da5-8cb3-43ac-f5b0-f38a727242a8")]

        let request = URLRequest(url: components.url!)

        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
