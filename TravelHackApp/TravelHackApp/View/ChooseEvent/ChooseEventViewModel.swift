//
//  ChooseEventViewModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

final class ChooseEventViewModel {
    
    private let coordinator: MainCoordinator
    private let service: ModelProtocol
    
    init(coordinator: MainCoordinator,
         service: ModelProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
    var addedPlaces: [GuideModel] = []
    
    var items: [GuideModel] = []
    
    func dismissController() {
        coordinator.dismissPresentedController()
    }
    
    func getGuides(completion: @escaping () -> Void) {
        service.getGuide { [weak self] guides in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.items = guides.shuffled()
                completion()
            }
        }
    }
    
    func nextScreen() {
        coordinator.rootScreen(models: addedPlaces)
    }
}
