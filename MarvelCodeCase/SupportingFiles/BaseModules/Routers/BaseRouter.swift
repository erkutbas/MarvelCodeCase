//
//  BaseRouter.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit

//public protocol BaseRouter: AnyObject {
//    
//    var navigationController: UINavigationController { get }
//    
//    func present(_ viewController: UIViewController, animated: Bool)
//    func present(_ viewController: UIViewController, animated: Bool, onDismissed: OnDismissed?)
//    func dismiss(animated: Bool)
//    
//    func push(_ viewController: UIViewController)
//    
//}
//
//public extension BaseRouter {
//    func present(_ viewController: UIViewController, animated: Bool) {
//        present(viewController, animated: animated, onDismissed: nil)
//    }
//}

//public class NavigationRouter: NSObject {
//    // 2
//    private let navigationController: UINavigationController
//    private let routerRootController: UIViewController?
//    private var onDismissForViewController:
//        [UIViewController: (() -> Void)] = [:]
//    // 3
//    public init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//        self.routerRootController =
//            navigationController.viewControllers.first
//        super.init()
//        navigationController.delegate = self
//    }
//    
//}
//
//extension NavigationRouter: BaseRouter {
//    // 1
//    public func present(_ viewController: UIViewController,
//                        animated: Bool,
//                        onDismissed: (() -> Void)?) {
//        onDismissForViewController[viewController] = onDismissed
//        navigationController.pushViewController(viewController,
//                                                animated: animated)
//    }
//    // 2
//    public func dismiss(animated: Bool) {
//        guard let routerRootController = routerRootController else {
//            navigationController.popToRootViewController(
//                animated: animated)
//            return
//        }
//        performOnDismissed(for: routerRootController)
//        navigationController.popToViewController(
//            routerRootController,
//            animated: animated)
//    }
//    // 3
//    private func performOnDismissed(for
//                                        viewController: UIViewController) {
//        guard let onDismiss =
//                onDismissForViewController[viewController] else {
//            return
//        }
//        onDismiss()
//        onDismissForViewController[viewController] = nil
//    }
//    
//}
//
//extension NavigationRouter: UINavigationControllerDelegate {
//    public func navigationController(
//        _ navigationController: UINavigationController,
//        didShow viewController: UIViewController,
//        animated: Bool) {
//        guard let dismissedViewController =
//                navigationController.transitionCoordinator?
//                .viewController(forKey: .from),
//              !navigationController.viewControllers
//                .contains(dismissedViewController) else {
//            return
//        }
//        performOnDismissed(for: dismissedViewController)
//    }
//}

