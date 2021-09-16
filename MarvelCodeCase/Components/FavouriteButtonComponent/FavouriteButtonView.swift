//
//  FavouriteButtonView.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import UIKit

class FavouriteButtonView: GenericBaseView<FavouriteButtonViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView(image: UIImage(imageLiteralResourceName: "favorite").withRenderingMode(.alwaysTemplate))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.tintColor = MarvelCodeCaseColor.defaultBackground.value
        temp.isUserInteractionEnabled = true
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        addTapGesture()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addSubview(containerView)
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.widthAnchor.constraint(equalToConstant: 50),
        
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    private func colorManager() {
        guard let data = returnData() else { return }
        if data.state {
            imageView.tintColor = MarvelCodeCaseColor.marvelRed.value
        } else {
            imageView.tintColor = MarvelCodeCaseColor.defaultBackground.value
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        colorManager()
    }
    
}

extension FavouriteButtonView: UIGestureRecognizerDelegate {
    
    @objc fileprivate func favouriteTapped(_ sender: UITapGestureRecognizer) {
        guard let data = returnData() else { return }
        isUserInteractionEnabled = false
        data.state.toggle()
        colorManager()
        startPressedAnimationCommon(withDuration: 0.3) { [weak self] finish in
            self?.isUserInteractionEnabled = true
            data.isFavouriteBlock(data.state)
        }
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .favouriteTapped)
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
}

fileprivate extension Selector {
    static let favouriteTapped = #selector(FavouriteButtonView.favouriteTapped)
}
