//
//  SplashCoordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift
import RxCocoa

class SplashCoordinator: BaseCoordinator<SplashScreenViewModel> {
    
    deinit {
        print("DEINIT SplashCoordinator")
    }
    
    private let disposeBag = DisposeBag()
    
    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    lazy var splashProcessCompletion: BooleanCompletionBlock = { [weak self] completed in
        if completed {
            self?.splashFinalize.accept(true)
            self?.dismissSplashCoordinator()
        }
    }
    
    override func start() {
        guard let viewController = SplashViewController.instantiate() else { return }
        viewController.viewModel = viewModel
        self.viewContoller = viewController
        subscribeSplashProcess()
    }
    
    private func subscribeSplashProcess() {
        viewModel.subscribeSplashProcess(completion: splashProcessCompletion).disposed(by: disposeBag)
    }
    
    private func dismissSplashCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    func listenSplahCoordinatorFinishes(completion: @escaping BooleanCompletionBlock) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
}
