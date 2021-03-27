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
    
    func dismissController() {
        coordinator.dismissPresentedController()
    }
    
    func nextScreen() {
        coordinator.rootScreen()
    }
}
