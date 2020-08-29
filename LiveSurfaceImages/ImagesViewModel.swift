//
//  ImagesViewModel.swift
//  LiveSurfaceImages
//
//  Created by Dariusz Ciesla on 29/08/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation
import Combine

class ImagesViewModel: ObservableObject {

    @Published var images: [ImageModel] = []
    var cancellationToken: AnyCancellable?

    init() {
        getImages()
    }

}

extension ImagesViewModel {

    func getImages() {
        cancellationToken = ImagesRequest.request(.imageList)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                receiveValue: {
                    self.images = Array($0.images.values).sorted(by: { (lhs, rhs) -> Bool in
                        lhs.index < rhs.index
                    })
            })
    }

}
