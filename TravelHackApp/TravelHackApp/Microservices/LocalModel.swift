//
//  LocalModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

final class LocalModel: ModelProtocol {
    private var stories: [StoryModel] = []
    private var news: [NewsModel] = []
    private var guide: [GuideModel] = []
    private var cities: [CityModel] = []
    
    init() {
        readFromFile()
    }
    
    func getStory(completion: @escaping ([StoryModel]) -> Void) {
        completion(stories)
    }
    
    func getNews(completion: @escaping ([NewsModel]) -> Void) {
        completion(news)
    }
    
    func getGuide(completion: @escaping ([GuideModel]) -> Void) {
        completion(guide)
    }
    
    func getCities(completion: @escaping ([CityModel]) -> Void) {
        // TODO: -
    }
    
    func readFromFile() {
        if let path = try! Bundle.main.path(forResource: "stories", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let stories = try! JSONDecoder().decode([StoryModel].self, from: data)
            self.stories = stories
        }
        
        if let path = try! Bundle.main.path(forResource: "guide", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let guide = try! JSONDecoder().decode(GuideModel.self, from: data)
            self.guide = [guide]
        }
        
        if let path = try! Bundle.main.path(forResource: "news", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let news = try! JSONDecoder().decode([NewsModel].self, from: data)
            self.news = news
        }
    }
}
