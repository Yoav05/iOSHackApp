//
//  PayViewModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import Foundation

final class PayViewModel: ObservableObject {
    
    private let coordinator: MainCoordinator
    private let service: ModelProtocol
    
    init(coordinator: MainCoordinator,
         service: ModelProtocol,
         items: [GuideModel]
         ) {
        self.coordinator = coordinator
        self.service = service
        self.items = items
    }
    
    @Published var items: [GuideModel] = []

    func qrCodeScreen() {
        coordinator.showQrScreen()
    }
}
