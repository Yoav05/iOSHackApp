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
        let controller = builder.createMainScreeen(coordinator: self)
        container.append(controller)
        window.rootViewController = controller
    }
    
    func showKolodaScreen() {
        let controller = builder.createKolodaScreen(coordinator: self)
        navigationController = UINavigationController(rootViewController: controller)
        presentController(controller: navigationController, animated: true, style: .overFullScreen)
    }
    
    func rootScreen() {
        let controller = builder.createRoutScreen(coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
}

