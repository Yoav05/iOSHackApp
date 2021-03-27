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
}

final class ViewBuilder: ViewBuilderProtocol {
    func createMainScreeen(coordinator: MainCoordinator) -> UIViewController {
        let model = LocalModel()
        let viewModel = MainViewModel(coordinator: coordinator, modelService: model)
        let view = MainView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
