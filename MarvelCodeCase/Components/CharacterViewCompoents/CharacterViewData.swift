//
//  CharacterViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class CharacterViewData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    
    init(imageData: CustomImageViewComponentData) {
        self.imageData = imageData
    }
    
}
