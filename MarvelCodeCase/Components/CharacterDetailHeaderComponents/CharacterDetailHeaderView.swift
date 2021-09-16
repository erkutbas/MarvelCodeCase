//
//  CharacterDetailHeaderView.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class CharacterDetailHeaderView: GenericBaseView<CharacterDetailHeaderViewData> {
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 2
        temp.clipsToBounds = true
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(imageContainer)
        
        NSLayoutConstraint.activate([
        
            imageContainer.topAnchor.constraint(equalTo: topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
    }

    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        imageContainer.setData(data: data.imageContainerData)
    }
    
}
