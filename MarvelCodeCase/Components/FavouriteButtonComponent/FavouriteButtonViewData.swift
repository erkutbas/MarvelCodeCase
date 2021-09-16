//
//  FavouriteButtonViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation

class FavouriteButtonViewData {
    
    public var state: Bool
    private(set) var isFavouriteBlock: BooleanCompletionBlock
    
    init(state: Bool, isFavouriteBlock: @escaping BooleanCompletionBlock) {
        self.state = state
        self.isFavouriteBlock = isFavouriteBlock
    }
    
}
