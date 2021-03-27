//
//  MainViewModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation


final class MainViewModel: ObservableObject {
    private let coordinator: MainCoordinator
    private let modelService: ModelProtocol
    
    init(coordinator: MainCoordinator, modelService: ModelProtocol) {
        self.coordinator = coordinator
        self.modelService = modelService
    }
    
    @Published var stories: [StoryModel] = []
    @Published var news: [NewsModel] = []
    @Published var cities: [CityModel] = []
    @Published var guide: GuideModel = GuideModel(
        previewImageUrl: "",
        title: "",
        description: "",
        inner: GuideModel.InnerModel(title: "", description: "", imagesUrl: nil)
    )
    
    func getStories() {
        modelService.getStory { [weak self] stories in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.stories = stories
            }
        }
    }
    
    func getNews() {
        modelService.getNews { [weak self] news in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.news = news
            }
        }
    }
    
    func getCities() {
        modelService.getCities { [weak self] cities in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.cities = cities
            }
        }
    }
    
    func getGuide() {
        modelService.getGuide { [weak self] guide in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.guide = guide
            }
        }
    }
}
