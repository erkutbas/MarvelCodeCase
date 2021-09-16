//
//  CharacterDetailHeaderViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class CharacterDetailHeaderViewData {
    
    private(set) var imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "")
    
    init(imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "")) {
        self.imageContainerData = imageContainerData
    }
    
}
