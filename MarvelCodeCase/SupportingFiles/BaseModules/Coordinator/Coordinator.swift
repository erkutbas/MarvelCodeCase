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

//extension Coordinator {
//    // 1
//    public func dismiss(animated: Bool) {
//        router.dismiss(animated: true)
//    }
//    // 2
//    public func presentChild(_ child: Coordinator,
//                             animated: Bool,
//                             onDismissed: (() -> Void)? = nil) {
//        childCoordinators.append(child)
//        child.present(animated: animated) { [weak self, weak child] in
//            guard let self = self, let child = child else {
//                return
//            }
//
//            self.removeChild(child)
//            onDismissed?()
//
//        }
//    }
//
//    private func removeChild(_ child: Coordinator) {
//        guard let index = childCoordinators.firstIndex(
//                where: { $0 === child }) else {
//            return
//        }
//        childCoordinators.remove(at: index)
//    }
//
//}
