//
//  GuideModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

struct GuideModel: Codable, Hashable {
    var previewImageUrl: String
    var title: String
    var description: String
    var inner: InnerModel?
    var date: String?
    var raiting: Int = 0
    
    struct InnerModel: Codable, Hashable {
        var title: String
        var description: String
        var imagesUrl: [String]?
    }
}
