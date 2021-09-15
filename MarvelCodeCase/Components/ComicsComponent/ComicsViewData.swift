//
//  ComicsViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class ComicsViewData {
    
    private(set) var comicsData: [ContentDisplayerViewData]
    private(set) var title: TitleContainerViewData?
    
    init(comicsData: [ContentDisplayerViewData]) {
        self.comicsData = comicsData
    }
    
    func setTitle(by value: TitleContainerViewData?) -> Self {
        title = value
        return self
    }
    
}
