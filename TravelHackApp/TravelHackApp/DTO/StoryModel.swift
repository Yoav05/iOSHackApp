//
//  StoryModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

struct StoryModel: Codable, Hashable {
    var circleImageUrl: String
    var circleTitle: String
    
    var substories: [SingleStorу]
    
    struct SingleStorу: Codable, Hashable {
        var description: String?
        var imageUrl: String
        var link: String?
    }
}
