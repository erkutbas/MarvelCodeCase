//
//  MainViewDataFormatter.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import MarvelDomainLayer

protocol MainViewDataFormatter {
    
    var data: CharacterListData? { get set }
    var paginationData: PaginationInfo { get }
    
    func getData(at index: Int) -> CharacterViewData?
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    
}
