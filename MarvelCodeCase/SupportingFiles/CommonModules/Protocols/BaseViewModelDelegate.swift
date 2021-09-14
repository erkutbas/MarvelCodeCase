//
//  BaseViewModelDelegate.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import RxSwift

public protocol BaseViewModelDelegate: AnyObject {
    
    var dismissInformer: PublishSubject<Void>? { get }
//    var errorPublisher: PublishSubject<CustomAlertData>? { get }
//    var activityStatePublisher: PublishSubject<ActivityStates>? { get }
    
}

extension BaseViewModelDelegate {
    func dismissCoordinator() {
        dismissInformer?.onNext(())
    }
    
    func subscribeDismissProcess(_ completion: @escaping OnDismissed) -> Disposable? {
        return dismissInformer?.subscribe(onNext: completion)
    }

//    func subscribeErrorPublisher(_ completion: @escaping ErrorPublishClosure) -> Disposable? {
//        return errorPublisher?.subscribe(onNext: completion)
//    }
//    
//    func subscribeActivityStatePublisher(_ completion: @escaping ActivityStatesCompletion) -> Disposable? {
//        return activityStatePublisher?.subscribe(onNext: completion)
//    }
//    
//    func updateActivityState(by value: ActivityStates) {
//        activityStatePublisher?.onNext(value)
//    }
    
}
