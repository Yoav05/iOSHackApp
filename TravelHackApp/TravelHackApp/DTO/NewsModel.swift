//
//  NewsModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

struct NewsModel: Codable, Hashable {
    var previewImageUrl: String
    var title: String
    var description: String
    var date: String
    
}
