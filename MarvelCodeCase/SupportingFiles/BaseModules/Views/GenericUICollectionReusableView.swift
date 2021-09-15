//
//  GenericUICollectionReusableView.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class GenericUICollectionReusableView<DataType, ViewType: GenericBaseView<DataType>>: BaseCollectionReusableView {
    
    lazy var genericView: ViewType = {
        let temp = ViewType()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        addSubview(genericView)
        
        NSLayoutConstraint.activate([
        
            genericView.leadingAnchor.constraint(equalTo: leadingAnchor),
            genericView.trailingAnchor.constraint(equalTo: trailingAnchor),
            genericView.topAnchor.constraint(equalTo: topAnchor),
            genericView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        
        ])
    }
    
    func setRowData(data: DataType) {
        genericView.setData(data: data)
    }
    
}
