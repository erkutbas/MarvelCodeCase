//
//  Coordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

public protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }

    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
    
}

