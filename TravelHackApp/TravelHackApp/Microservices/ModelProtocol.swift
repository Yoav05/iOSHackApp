//
//  ModelProtocol.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

protocol ModelProtocol {
    func getStory(completion: @escaping ([StoryModel]) -> Void)
    func getNews(completion: @escaping ([NewsModel]) -> Void)
    func getGuide(completion: @escaping (GuideModel) -> Void)
    func getCities(completion: @escaping ([CityModel]) -> Void)
}
