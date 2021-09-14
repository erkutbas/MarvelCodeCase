//
//  BaseCoordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit
import Swinject

public typealias OnDismissed = () -> Void

public class BaseCoordinator<T: BaseViewModelDelegate>: NSObject, Coordinator {
    
    public let viewModel: T
    
    public init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    public var AssemblerResolver = Assembler.sharedAssembler.resolver
    
    public var navigationController = UINavigationController()
    public var viewContoller = UIViewController()
    public var childCoordinators: [Coordinator] = []
    public var parentCoordinator: Coordinator?
    
    public func start() {
        //fatalError("Start method should be implemented.")
    }
    
    public func start(coordinator: Coordinator) {
        // binary search, tree etc ???
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    public func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    public func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
    
    public func didFinish(coordinator: Coordinator, completion: OnDismissed) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
            completion()
        }
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
    
}
