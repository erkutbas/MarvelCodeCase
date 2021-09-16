//
//  MainViewDataFormatter.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import MarvelDomainLayer

protocol MainViewDataFormatter {
    
    var paginationData: PaginationInfo { get set }
    
    func getRawData(at index: Int) -> CharacterData
    
    func getData(at index: Int) -> ContentDisplayerViewData?
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    func getCount() -> Int
    
    func refresh()
    
    func setData(with response: CharacterDataResponse)
    
    func setData(with list: [CharacterData])
    
}
