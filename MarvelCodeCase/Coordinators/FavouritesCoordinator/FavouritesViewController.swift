//
//  FavouritesViewController.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import UIKit
import RxSwift

class FavouritesViewController: BaseViewController<FavouritesViewModel> {
    
    deinit {
        print("DEINIT FavouritesViewController")
    }
    
    weak var router: FavouritesRouter?
    
    private let disposeBag = DisposeBag()
    
    private var characterListComponent: ItemCollectionComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupTitle()
        addCharacterListComponent()
        listenViewModelDataState()
        listenViewModelSelectedData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setTintColor(.white)
        navigationController?.backgroundColor(MarvelCodeCaseColor.marvelRed.value)
        viewModel.getData()
    }
    
    private func addCharacterListComponent() {
        characterListComponent = ItemCollectionComponent()
        characterListComponent.translatesAutoresizingMaskIntoConstraints = false
        characterListComponent.setupDelegation(with: viewModel)
        
        view.addSubview(characterListComponent)
        
        NSLayoutConstraint.activate([
        
            characterListComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterListComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterListComponent.topAnchor.constraint(equalTo: view.topAnchor),
            characterListComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    private func listenViewModelDataState() {
        viewModel.listenCollectionState { [weak self](state) in
            switch state {
            case .done:
                self?.characterListComponent.reloadCollectionComponent()
            case .loading:
                break
            case .reloadIndex(let indexPath):
                self?.characterListComponent
                    .reloadItem(at: indexPath)
            }
        }
    }
    
    private func listenViewModelSelectedData() {
        viewModel.listenSelectedItem { [weak self] value in
            self?.router?.pushDetail(with: value)
        }
    }
    
    private func setupTitle() {
        view.backgroundColor = .white
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "MARVEL", attributes:[
                                                    .foregroundColor: UIColor.white,
                                                    .font: UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold),
                                                    .kern: -4])
        navTitle.append(NSMutableAttributedString(string: " Favourites", attributes:[
                                                    .font: UIFont.boldSystemFont(ofSize: 16.0),
                                                    .foregroundColor: UIColor.white,
                                                    .kern: -0.75]))
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
    
}
