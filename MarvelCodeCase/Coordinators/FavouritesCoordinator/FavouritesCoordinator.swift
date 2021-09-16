//
//  FavouritesCoordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation
import RxSwift

class FavouritesCoordinator: BaseCoordinator<FavouritesViewModel> {

    deinit {
        print("DEINIT FavouritesCoordinator")
    }
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        let viewController = FavouritesViewController(viewModel: viewModel)
        viewController.router = self
        self.viewContoller = viewController
        viewModel.subscribeDismissProcess(dismissListener)?.disposed(by: disposeBag)
    }
    
    private lazy var dismissListener: OnDismissed = { [weak self] in
        guard let self = self else { return }
        self.parentCoordinator?.didFinish(coordinator: self)
    }
    
    private func forwardCharacterDetailCoordinator(with id: Int) {
        guard let characterDetailCoordinator = assemblerResolver.resolve(CharacterDetailCoordinator.self) else { return }
        start(coordinator: characterDetailCoordinator.setupCharacterId(by: id))
        viewContoller.navigationController?.pushViewController(characterDetailCoordinator.viewContoller, animated: true)
    }
    
}

extension FavouritesCoordinator: FavouritesRouter {

    func pushDetail(with id: Int) {
        forwardCharacterDetailCoordinator(with: id)
    }

}
