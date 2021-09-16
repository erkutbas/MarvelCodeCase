//
//  MainViewDataImplementation.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import MarvelDomainLayer

class MainViewDataImplementation: MainViewDataFormatter {
    
    private var data: CharacterListData!
    private var list: [CharacterData] = [CharacterData]()
    var paginationData: PaginationInfo = PaginationInfo()
    
    func getData(at index: Int) -> ContentDisplayerViewData? {
        guard index < list.count else {
            return nil
        }
        let data = list[index]
        return ContentDisplayerViewData(imageData: CustomImageViewComponentData(imageUrl: data.thumbnail.imageContentCreator()), name: data.name)
    }
    
    func getRawData(at index: Int) -> CharacterData {
        return list[index]
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= paginationData.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: CharacterDataResponse) {
        self.data = response.data
        self.paginationData.resultCount = data.count
        self.paginationData.refreshing = false
        self.list.append(contentsOf: response.data.results)
    }
    
    func setData(with list: [CharacterData]) {
        self.list = list
    }
    
    func refresh() {
        paginationData.offset = 0
        paginationData.refreshing = true
        list.removeAll()
    }
    
}
