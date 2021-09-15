//
//  CharacterDetailDataManagerProtocol.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import RxSwift

protocol CharacterDetailDataManagerProtocol {
    
    func getCharacterDetailData(with characterId: Int)
    
    func getComicsList(with characterId: Int)
    
    func subscribeDataPublisher(with completion: @escaping (CharacterDetailViewData) -> Void)
    
}
