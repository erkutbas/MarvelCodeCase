//
//  ItemCollectionViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class ItemCollectionViewData {
    
    private(set) var isRefreshingSupported: Bool = false
    
    init(isRefreshingSupported: Bool = false) {
        self.isRefreshingSupported = isRefreshingSupported
    }
    
}
