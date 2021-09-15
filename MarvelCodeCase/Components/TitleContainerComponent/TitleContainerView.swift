//
//  TitleContainerView.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import UIKit

class TitleContainerView: GenericBaseView<TitleContainerViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(title)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            title.topAnchor.constraint(equalTo: containerView.topAnchor),
            title.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26),
            title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
        ])
    }

    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        title.text = data.title
    }
    
}
