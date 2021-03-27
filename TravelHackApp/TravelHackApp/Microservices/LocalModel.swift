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
        // TODO: -
    }
    
    func getNews(completion: @escaping ([NewsModel]) -> Void) {
        // TODO: -
    }
    
    func getGuide(completion: @escaping (GuideModel) -> Void) {
        // TODO: -
    }
    
    func getCities(completion: @escaping ([CityModel]) -> Void) {
        // TODO: -
    }
    
    func readFromFile() {
        if let path = try! Bundle.main.path(forResource: "stories", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            print(jsonResult)
        }
    }
}
