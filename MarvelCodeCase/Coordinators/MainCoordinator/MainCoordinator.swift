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
        navigationController.viewControllers = [mainViewController]
        
        subscribeForFurtherCoordinators()
        
    }
    
    private func subscribeForFurtherCoordinators() {
        
    }
    
}
