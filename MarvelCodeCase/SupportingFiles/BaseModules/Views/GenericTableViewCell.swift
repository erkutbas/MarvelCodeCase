//
//  GenericTableViewCell.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit

class GenericTableViewCell<DataType, ViewType: GenericBaseView<DataType>>: BaseTableViewCell {
    
    lazy var genericView: ViewType = {
        let temp = ViewType()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        contentView.addSubview(genericView)
        
        NSLayoutConstraint.activate([
        
            genericView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genericView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genericView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        
        ])
    }
    
    func setRowData(data: DataType) {
        genericView.setData(data: data)
    }
    
//    func subscribeToSelectedRow(completion: @escaping GenericDataProtocolCompletion) {
//        isUserInteractionEnabled = false
//        genericView.startPressedAnimationCommon { [weak self](finish) in
//            if finish {
//                self?.isUserInteractionEnabled = true
//                guard let data = self?.genericView.returnData() as? GenericRowDataProtocol else { return }
//                completion(data)
//            }
//        }
//    }
//    
//    func returnGenericRowData() -> GenericRowDataProtocol? {
//        guard let data = self.genericView.returnData() as? GenericRowDataProtocol else { return nil }
//        return data
//        
//    }
    
}
