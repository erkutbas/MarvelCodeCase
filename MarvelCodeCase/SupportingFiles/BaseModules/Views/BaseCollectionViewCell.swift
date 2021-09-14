//
//  BaseCollectionViewCell.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }
    
    func setupView() {}
    func addMajorViews() {}
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
}
