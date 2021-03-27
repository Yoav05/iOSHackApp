//
//  NetworkService.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

final class NetworkService: ModelProtocol {
    
    enum Endpoints {
        case stories
        case guide
        case userInfo
        case routeList
        
        private var urlString: String {
            switch self {
            case .stories:
                return "http://77.223.96.208/api/getStories/"
            case .guide:
                return "http://77.223.96.208/api/getGuide/?city_id=1"
            case .userInfo:
                return "http://77.223.96.208/api/getUserInfo/"
            case .routeList:
                return "http://77.223.96.208/api/getRouteList/"
            }
        }
        
        var url: URL {
            return URL(string: urlString)!
        }
    }
    
    func getStory(completion: @escaping ([StoryModel]) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        let url = Endpoints.stories.url
        let task = defaultSession.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if let data = data {
                let stories = try! JSONDecoder().decode(Stories.self, from: data)
                completion(stories.results ?? [])
            } else {
                print("Не распарсили дату")
                completion([])
            }
        }
        task.resume()
    }
    
    func getGuide(completion: @escaping ([GuideModel]) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        let url = Endpoints.guide.url
        let task = defaultSession.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if let data = data {
                let guides = try! JSONDecoder().decode(Guides.self, from: data)
                completion(guides.results ?? [])
            } else {
                print("Не распарсили дату")
                completion([])
            }
        }
        task.resume()
    }
    
    func getCities(completion: @escaping ([CityModel]) -> Void) {
        // TODO: -
    }
}


fileprivate struct Stories: Codable {
    let results: [StoryModel]?
}

fileprivate struct Guides: Codable {
    let results: [GuideModel]?
}
