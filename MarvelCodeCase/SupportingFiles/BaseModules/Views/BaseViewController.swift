//
//  BaseViewController.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModelDelegate>: UIViewController, InteractivePopGestureDelegate, ViewControllerTypeProtocol {
    
    var viewTitle: String? { return nil }
    
    var initialInteractivePopGestureRecognizerDelegate: UIGestureRecognizerDelegate?

    var viewModel: T!

    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setInitialInteractivePopGestureRecognizerDelegate()
        prepareViewControllerConfigurations()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetInteractivePopGestureForNavigationController()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assignInteractivePopGestureToNavigationController()
    }
    
    open override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            viewModel.dismissCoordinator()
        }
    }
    
    open func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
        setViewControllerName()
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    private func setViewControllerName() {
        title = viewTitle
    }
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView(style: .gray)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    public func startIndicatingActivity() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(self.activityIndicator)
            NSLayoutConstraint.activate([
                self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ])
            self.activityIndicator.startAnimating()
        }
        
    }
    
    public func stopIndicatingActivity() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.removeFromSuperview()
            self.activityIndicator.stopAnimating()
        }
    }
    
}
