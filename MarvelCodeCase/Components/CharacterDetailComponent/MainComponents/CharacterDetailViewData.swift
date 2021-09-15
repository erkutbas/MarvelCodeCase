//
//  CharacterDetailViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

class CharacterDetailViewData {
    
    private(set) var headerViewData: CharacterDetailHeaderViewData?
    private(set) var titleBasedViewDataList: [TitleBasedViewData] = [TitleBasedViewData]()
    private(set) var comicsViewData: ComicsViewData?
    
    func setCharacterDetailHeaderViewData(by value: CharacterDetailHeaderViewData) -> Self {
        headerViewData = value
        return self
    }
    
    func setTitleBasedViewData(by value: [TitleBasedViewData]) -> Self {
        titleBasedViewDataList = value
        return self
    }
    
    func setComicsViewData(by value: ComicsViewData) -> Self {
        comicsViewData = value
        return self
    }
    
}
