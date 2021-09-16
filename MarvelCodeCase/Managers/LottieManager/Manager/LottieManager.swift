//
//  LottieManager.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//
import Foundation
import RxSwift
import RxCocoa
import UIKit

class LottieManager: LottieManagerProtocol {
    
    private let disposeBag = DisposeBag()
    
    @AtomicValue private var animationArray: [Int] = [Int]()
    private lazy var workItem = DispatchWorkItem(block: process)
    private lazy var process : () -> Void = { [weak self] in
        self?.stopAnimation()
    }
    
    private var process1 = PublishSubject<Bool>()
    private var process2 = PublishSubject<Bool>()
    
    private lazy var lottiViewController = LottieViewController(name: "9844-loading-40-paperplane", loopMode: .loop)
    
    init() {
        task()
    }
    
    func task() {
        Observable
            .combineLatest(process1, process2)
            .subscribe { result in
                guard let element = result.element else { return }
                if element.0 && element.1 {
                    DispatchQueue.main.async(execute: self.workItem)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func onPreExecute() {
        
        if animationArray.count == 0 {
            animationArray.append(1)
            fireAnimation()
        }
        
    }
    
    func onPostExecute() {
        if animationArray.count == 1 {
            process1.onNext(true)
        }
    }
    
    private func fireAnimation() {
        guard let topMostViewController = UIApplication.topViewController() else { return }
        lottiViewController.modalTransitionStyle = .crossDissolve
        lottiViewController.modalPresentationStyle = .overFullScreen
        topMostViewController.present(self.lottiViewController, animated: true) { [weak self] in
            self?.process2.onNext(true)
        }
    }
    
    private func stopAnimation() {
        self.lottiViewController.animationOperationKiller { [weak self] in
            self?.animationArray.removeAll()
        }
    }
    
}
