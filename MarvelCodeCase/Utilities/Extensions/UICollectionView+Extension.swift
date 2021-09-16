//
//  UICollectionView+Extension.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

extension UICollectionView {
    
    func genericRegisterCell<T>(_ type: T.Type) where T: BaseCollectionViewCell {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func genericDequeCell<T>(indexPath: IndexPath) -> T? where T: BaseCollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
    
}
