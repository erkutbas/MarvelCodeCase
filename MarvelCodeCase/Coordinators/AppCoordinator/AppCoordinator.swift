//
//  AppCoordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit
import RxSwift
import Swinject

class AppCoordinator: BaseCoordinator<AppViewModel> {
    
    private let disposeBag = DisposeBag()
    
    var window = UIWindow(frame: UIScreen.main.bounds)

    private lazy var commonApplicationLauncher: BooleanCompletionBlock = { [weak self] completed in
        if completed {
            //self?.launchApplication()
            self?.launchMainProcess()
        }
    }
    
    override func start() {
        window.makeKeyAndVisible()
        loadSplashScreen()
    }
    
    private func launchApplication() {
        
        launchMainProcess()
        
//        switch UserDefaultsGenericStructStore.hasLaunchBefore {
//        case .launched:
//            /*
//             We do not have a authentication flow, login, register etc for this assignment.
//             if we do, a session manager can decide either go to login, register or to main screens
//             */
//            launchMainProcess()
//        case .notLaunched:
//            launchTutorialProcess()
//        }

    }
    
    // MARK: - Main Screens Implementations -
    private func launchMainProcess() {
        removeChildCoordinators()

        guard let coordinator = assemblerResolver.resolve(MainCoordinator.self) else { return }
        start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.navigationController, withAnimation: true)

    }
    
    // MARK: - Tutorial Screens Implementations -
    private func launchTutorialProcess() {
//        UserDefaultsGenericStructStore.hasLaunchBefore = .launched
//
//        guard let coordinator = AssemblerResolver.resolve(TutorialCoordinator.self) else { return }
//        start(coordinator: coordinator)
//
//        coordinator.listenTutorialCoordinatorFinishes(completion: commonApplicationLauncher).disposed(by: disposeBag)
//
//        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    // MARK: - Splash Screen Implemententations -
    private func loadSplashScreen() {
        removeChildCoordinators()
        guard let coordinator = assemblerResolver.resolve(SplashCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        coordinator.listenSplahCoordinatorFinishes(completion: commonApplicationLauncher).disposed(by: disposeBag)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    private func registerTutorialObservers() {
        
    }
    
}
