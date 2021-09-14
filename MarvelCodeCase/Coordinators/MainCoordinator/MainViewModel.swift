//
//  MainViewModel.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift

class MainViewModel: BaseViewModelDelegate {
    
    // Mark: - Observers -
    private let disposeBag = DisposeBag()
    
    var dismissInformer: PublishSubject<Void>?
    
}
