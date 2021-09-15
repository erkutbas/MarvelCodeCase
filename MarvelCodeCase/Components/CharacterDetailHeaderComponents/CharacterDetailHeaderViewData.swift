//
//  CharacterDetailHeaderViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class CharacterDetailHeaderViewData {
    
    private(set) var imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04/portrait_uncanny.jpg")
    
    init(imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04/portrait_uncanny.jpg")) {
        self.imageContainerData = imageContainerData
    }
    
}
