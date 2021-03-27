//
//  RoutViewModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

final class RoutViewModel: ObservableObject {
    
    private let coordinator: MainCoordinator
    private let service: ModelProtocol
    
    init(coordinator: MainCoordinator,
         service: ModelProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
    @Published var items: [GuideModel] = []

    func payScreen() {
        coordinator.showPayScreen()
    }
}
