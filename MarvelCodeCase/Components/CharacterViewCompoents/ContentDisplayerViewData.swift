//
//  ContentDisplayerViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class ContentDisplayerViewData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var name: String
    private(set) var isInfoViewHidden: Bool = false
    
    init(imageData: CustomImageViewComponentData,
         name: String,
         isInfoViewHidden: Bool = false) {
        self.imageData = imageData
        self.name = name
        self.isInfoViewHidden = isInfoViewHidden
    }
    
}
