//
//  ViewBuilder.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import UIKit

protocol ViewBuilderProtocol {
    func createMainScreeen(coordinator: MainCoordinator) -> UIViewController
    func createKolodaScreen(coordinator: MainCoordinator, items: [GuideModel]) -> UIViewController
    func createRoutScreen(coordinator: MainCoordinator, models: [GuideModel]) -> UIViewController
    func createPayScreen(coordinator: MainCoordinator, models: [GuideModel]) -> UIViewController
    func createQrScreen(coordinator: MainCoordinator) -> UIViewController
}

final class ViewBuilder: ViewBuilderProtocol {
    
    private let service = NetworkService()
    
    func createMainScreeen(coordinator: MainCoordinator) -> UIViewController {
        let model = service
        let viewModel = MainViewModel(coordinator: coordinator, modelService: model)
        let view = MainView(viewModel: viewModel)
        let controller = MainHostingController(rootView: view)
        return controller
    }
    
    func createKolodaScreen(coordinator: MainCoordinator, items: [GuideModel]) -> UIViewController {
        let model = service
        let viewModel = ChooseEventViewModel(coordinator: coordinator, service: model, items: items)
        let controller = ChooseEventViewController(viewModel: viewModel)
        return controller
    }
    
    func createRoutScreen(coordinator: MainCoordinator, models: [GuideModel]) -> UIViewController {
        let model = service
        let viewModel = RoutViewModel(coordinator: coordinator, service: model, items: models)
        let view = RoutScreen(viewModel: viewModel)
        let controller = RoutScreenViewController(rootView: view)
        return controller
    }
    
    func createPayScreen(coordinator: MainCoordinator, models: [GuideModel]) -> UIViewController {
        let model = service
        let viewModel = PayViewModel(coordinator: coordinator, service: model, items: models)
        let view = PayScreen(viewModel: viewModel)
        let controller = PayScreenViewController(rootView: view)
        return controller
    }
    
    func createQrScreen(coordinator: MainCoordinator) -> UIViewController {
        let model = service
        let viewModel = QrViewModel(coordinator: coordinator, service: model)
        let view = QrScreen(viewModel: viewModel)
        let controller = QrScreenViewController(rootView: view)
        return controller
    }
}
