//
//  MainViewDataImplementation.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import MarvelDomainLayer

class MainViewDataImplementation: MainViewDataFormatter {
    
    var data: CharacterListData?
    var paginationData: PaginationInfo = PaginationInfo()
    
    func getData(at index: Int) -> CharacterViewData? {
        guard let data = data else { return nil }
        return CharacterViewData(imageData: CustomImageViewComponentData(imageUrl: imageContentCreator(with: data.results[index].thumbnail)))
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        return data?.count ?? 0
    }
    
    private func imageContentCreator(with thumbnail: Thumbnail) -> String {
        return "\(thumbnail.path)/portrait_uncanny.\(thumbnail.thumbnailExtension)"
    }
    
}
