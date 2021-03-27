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
    func createKolodaScreen(coordinator: MainCoordinator) -> UIViewController
    func createRoutScreen(coordinator: MainCoordinator) -> UIViewController
}

final class ViewBuilder: ViewBuilderProtocol {
    func createMainScreeen(coordinator: MainCoordinator) -> UIViewController {
        let model = LocalModel()
        let viewModel = MainViewModel(coordinator: coordinator, modelService: model)
        let view = MainView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
    
    func createKolodaScreen(coordinator: MainCoordinator) -> UIViewController {
        let model = LocalModel()
        let viewModel = ChooseEventViewModel(coordinator: coordinator, service: model)
        let controller = ChooseEventViewController(viewModel: viewModel)
        return controller
    }
    
    func createRoutScreen(coordinator: MainCoordinator) -> UIViewController {
        let view = RoutScreen()
        let controller = RoutScreenViewController(rootView: view)
        return controller
    }
}
