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
    @Published var cities: [CityModel] = []
    @Published var guides: [GuideModel] = []
    
    func getStories() {
        modelService.getStory { [weak self] stories in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.stories = stories
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
        modelService.getGuide { [weak self] guides in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.guides = guides
                print(guides)
            }
        }
    }
    
    func showKolodaScreen() {
        coordinator.showKolodaScreen()
    }
    
    func presentDetailed(model: GuideModel) {
        coordinator.presentDetailedNews(model: model)
    }
}
