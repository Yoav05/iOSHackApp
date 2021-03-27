//
//  StoryModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

struct StoryModel: Codable, Hashable {
    var id: Int
    var circleImageUrl: String
    var circleTitle: String
    
    var substories: [SingleStorу]
    
    struct SingleStorу: Codable, Hashable {
        var id: Int
        var description: String?
        var imageUrl: String
        var link: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case imageUrl = "image"
            case link = "link"
            case description = "description"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case circleImageUrl = "circle_image"
        case circleTitle = "circle_title"
        case substories = "images"
    }
}
