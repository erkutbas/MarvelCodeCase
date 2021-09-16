//
//  CharacterDetailCoordinator.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import RxSwift

class CharacterDetailCoordinator: BaseCoordinator<CharacterDetailViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        self.viewContoller = CharacterDetailViewController(viewModel: viewModel)
        viewModel.subscribeDismissProcess(dismissListener)?.disposed(by: disposeBag)
    }
    
    func setupCharacterId(by value: Int) -> Self {
        _ = viewModel.setupCharacterId(by: value)
        return self
    }
    
    private lazy var dismissListener: OnDismissed = { [weak self] in
        guard let self = self else { return }
        self.parentCoordinator?.didFinish(coordinator: self)
    }
    
}
