//
//  CharacterDetailViewModel.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import RxSwift
import MarvelDomainLayer
import NetworkEntityLayer

class CharacterDetailViewModel: BaseViewModelDelegate {
    
    var dismissInformer: PublishSubject<Void>? = PublishSubject<Void>()
    private var dataState: CharacterDetailDataBlock?
    
    private var characterId: Int?
    private let dataManager: CharacterDetailDataManagerProtocol
    
    init(dataManager: CharacterDetailDataManagerProtocol) {
        self.dataManager = dataManager
        listenDataManager()
    }
    
    func setupCharacterId(by value: Int) -> Self {
        self.characterId = value
        return self
    }
    
    func getData() {
        guard let id = characterId else { return }
        dataManager.getCharacterDetailData(with: id)
        dataManager.getComicsList(with: id)
    }
    
    func listenDataManager() {
        dataManager.subscribeDataPublisher { [weak self] data in
            guard let self = self else { return }
            self.dataState?(data)
        }
    }
    
    func listenDataState(completion: @escaping CharacterDetailDataBlock) {
        dataState = completion
    }
    
    // MARK: - Listeners
    private lazy var datalistener: (CharacterDetailViewData) -> Void = { [weak self] data in
        guard let self = self else { return }
        self.dataState?(data)
    }
    
}
