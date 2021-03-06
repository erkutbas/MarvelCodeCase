//
//  ContentDisplayerCollectionViewCell.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class ContentDisplayerCollectionViewCell: GenericCollectionViewCell<GenericDataProtocol, ContentDisplayerView> {
    
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    func setViewConfigurations() {
        backgroundColor = .white
        contentView.backgroundColor = .white
    }
    
}
