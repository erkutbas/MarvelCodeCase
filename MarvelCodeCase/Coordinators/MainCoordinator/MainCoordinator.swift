//
//  MainCoordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift

class MainCoordinator: BaseCoordinator<MainViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        let mainViewController = MainViewController(viewModel: viewModel)
        mainViewController.router = self
        navigationController.viewControllers = [mainViewController]
    }
    
    private func forwardCharacterDetailCoordinator(with id: Int) {
        guard let characterDetailCoordinator = assemblerResolver.resolve(CharacterDetailCoordinator.self) else { return }
        start(coordinator: characterDetailCoordinator.setupCharacterId(by: id))
        self.navigationController.pushViewController(characterDetailCoordinator.viewContoller, animated: true)
    }
    
}

extension MainCoordinator: MainViewRouter {
    
    func pushDetail(with id: Int) {
        forwardCharacterDetailCoordinator(with: id)
    }
    
}
