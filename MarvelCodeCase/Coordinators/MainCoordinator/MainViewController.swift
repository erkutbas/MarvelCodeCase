//
//  MainViewController.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController<MainViewModel> {
    
    weak var router: MainViewRouter?
    
    private let disposeBag = DisposeBag()
    
    private var characterListComponent: ItemCollectionComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupTitle()
        appendRefreshButton()
        addCharacterListComponent()
        
        listenViewModelDataState()
        listenViewModelSelectedData()
        
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setTintColor(.white)
        navigationController?.backgroundColor(MarvelCodeCaseColor.marvelRed.value)
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
//                self?.dimmingView.activationManager(activate: false)
            case .loading:
                break
//                self?.dimmingView.activationManager(activate: true)
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
    
    private func appendRefreshButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: .refreshTapped)
        barButton.tintColor = .white
        navigationItem.rightBarButtonItem = barButton
    }
    
    private func setupTitle() {
        view.backgroundColor = .white
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "MARVEL", attributes:[
                                                    .foregroundColor: UIColor.white,
                                                    .font: UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold),
                                                    .kern: -4])
        navTitle.append(NSMutableAttributedString(string: " Character Explorer", attributes:[
                                                    .font: UIFont.boldSystemFont(ofSize: 16.0),
                                                    .foregroundColor: UIColor.white,
                                                    .kern: -0.75]))
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
    
    @objc fileprivate func refreshTapped(_ sender: UIBarButtonItem) {
        viewModel.refreshData()
    }
    
}

fileprivate extension Selector {
    static let refreshTapped = #selector(MainViewController.refreshTapped)
}
