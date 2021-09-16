//
//  PersistencyDataProtocol.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation
import MarvelDomainLayer

protocol PersistencyDataProtocol {
    
    func getFavoriteItems(with completion: @escaping ([CharacterData]) -> Void)
    
    func addFavorite(with data: CharacterData)
    
    func removeFavourite(with data: CharacterData)
    
    func checkExists(with data: CharacterData) -> Bool
    
}
