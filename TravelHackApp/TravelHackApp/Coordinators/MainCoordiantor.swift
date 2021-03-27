//
//  MainCoordinator.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import UIKit

final class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var container: [UIViewController] = []
    
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private let builder: ViewBuilderProtocol
    
    init(
        window: UIWindow,
        navigationController: UINavigationController,
        builder: ViewBuilderProtocol
    ) {
        self.window = window
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func start() {
//        window.rootViewController = navigationController
        let controller = builder.createMainScreeen(coordinator: self)
        container.append(controller)
        window.rootViewController = controller
//        navigationController.pushViewController(controller, animated: true)
    }
}

