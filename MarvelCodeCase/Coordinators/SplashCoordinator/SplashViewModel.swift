//
//  SplashViewModel.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxCocoa
import RxSwift

public typealias BooleanCompletionBlock = (Bool) -> Void

class SplashScreenViewModel: BaseViewModelDelegate {
    var dismissInformer: PublishSubject<Void>?

    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    /// Description: This module could be used to get app configuration files,
    /// app initialize process or application session management etc
    func startSplashProcess() {
        
        /*
         let's inform to move forward
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            print("takasi")
            self?.fireSplashProcessFinish()
        }
    }
    
    func subscribeSplashProcess(completion: @escaping BooleanCompletionBlock) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
    func fireSplashProcessFinish() {
        splashFinalize.accept(true)
    }
    
}
