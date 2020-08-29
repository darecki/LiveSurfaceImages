//
//  Image.swift
//  LiveSurface
//
//  Created by Dariusz Ciesla on 29/08/2020.
//

import Foundation

struct Image: Decodable, Hashable {
    let index: Int
    let name: String
    let number: String
    let image: String
    let category: String
    let version: String
    let tags: ImageTags
}

struct ImageTags: Decodable, Hashable {
    let sizedescription: String
    let sizescale: String
    let sizewidth: String
    let sizewidtharc: String
    let sizeheight: String
    let sizeheightarc: String
    let sizedepth: String
    let sizedeptharc: String
    let sizeunits: String
}

extension Image {
    init(index: Int) {
        self = Image(index: index, name: "", number: "", image: "", category: "", version: "", tags: ImageTags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: ""))
    }
}
