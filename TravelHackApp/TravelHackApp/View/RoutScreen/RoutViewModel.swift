//
//  RoutViewModel.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import MapKit

final class RoutViewModel: ObservableObject {
    
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
    
    @Published var items: [GuideModel]
    lazy var points: [MapGuideModel] = {
        self.items.compactMap { (model) -> MapGuideModel? in
            MapGuideModel(coordinate: .init(latitude: model.lat ?? 0.0, longitude: model.lon ?? 0.0))
        }
    }()
    
    func payScreen() {
        coordinator.showPayScreen(models: items)
    }
}

struct MapGuideModel: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

