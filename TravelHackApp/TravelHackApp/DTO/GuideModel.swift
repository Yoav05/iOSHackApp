//
//  GuideModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

// MARK: - Guide
struct GuideModel: Codable, Hashable {
    var time: Double?
    let id: Int?
    let category: Category?
    let city: City?
    let title, guideDescription: String?
    let previewImage: String?
    let created: String?
    let author: Author?
    let rating: Int?
    let isNews, isEvent: Bool?
    let lat, lon: Double?
    let eventDate: String?
    let blocks: [Block]?
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id, category, city, title
        case guideDescription = "description"
        case previewImage = "preview_image"
        case created, author, rating
        case isNews = "is_news"
        case isEvent = "is_event"
        case lat, lon
        case eventDate = "event_date"
        case blocks
        case time
        case imageUrl = "image_url"
    }
    
    struct Block: Codable, Hashable {
        let id: Int?
        let title, blockDescription: String?
        let image: String?
        let carousel: [Carousel]?

        enum CodingKeys: String, CodingKey {
            case id, title
            case blockDescription = "description"
            case image, carousel
        }
    }
    
    struct Author: Codable, Hashable {
        let id: Int?
        let lastName, firstName: String?
        let patronymic: String?

        enum CodingKeys: String, CodingKey {
            case id
            case lastName = "last_name"
            case firstName = "first_name"
            case patronymic
        }
    }
    
    struct Carousel: Codable, Hashable {
        let id: Int?
        let image: String?
    }
    
    struct Category: Codable, Hashable {
        let id: Int?
        let name, color: String?
    }
    struct City: Codable, Hashable {
        let id: Int?
        let name: String?
    }
}
