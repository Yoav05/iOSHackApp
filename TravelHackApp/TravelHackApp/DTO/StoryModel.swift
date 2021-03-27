//
//  StoryModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

struct StoryModel: Codable {
    var circleImageUrl: String
    var circleTitle: String
    
    var substories: [SingleStorу]
    
    struct SingleStorу {
        var description: String?
        var image: String
        var link: String?
    }
}
