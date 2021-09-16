//
//  CharacterDetailViewController.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit
import RxSwift

class CharacterDetailViewController: BaseViewController<CharacterDetailViewModel> {
    
    private let disposeBag = DisposeBag()
    
    private var characterDetailComponent: CharacterDetailView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = .white
        appendViewModelListeners()
        addCharacterDetailComponent()
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.transparentNavigationBar()
    }
    
    private func addCharacterDetailComponent() {
        characterDetailComponent = CharacterDetailView()
        characterDetailComponent.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(characterDetailComponent)

        NSLayoutConstraint.activate([

            characterDetailComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterDetailComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterDetailComponent.topAnchor.constraint(equalTo: view.topAnchor),
            characterDetailComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    private func appendViewModelListeners() {
        viewModel.listenDataState { [weak self] data in
            self?.characterDetailComponent.setData(data: data)
        }
    }
}
