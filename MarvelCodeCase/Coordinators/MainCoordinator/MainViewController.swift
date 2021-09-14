//
//  MainViewController.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController<MainViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = .white
        
    }
    
}
