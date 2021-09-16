//
//  CharacterDetailDataManager.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import RxSwift
import MarvelDomainLayer
import NetworkEntityLayer

typealias CharacterDetailDataBlock = (CharacterDetailViewData) -> Void

class CharacterDetailDataManager: CharacterDetailDataManagerProtocol {
    
    private var data = CharacterDetailViewData()
    private var characterData: CharacterData?
    private var dataBlock: CharacterDetailDataBlock?
    
    private let callBack: CharacterDataResponseCallBack
    private let characterDetailUseCase: CharacterDetailUseCase
    private let comicsCallBack: ComiscDataCallBack
    private let comicsDataUseCase: ComicsDataUseCase
    private let persistencyManager: PersistencyDataProtocol
    
    init(callBack: CharacterDataResponseCallBack,
         characterDetailUseCase: CharacterDetailUseCase,
         comicsCallBack: ComiscDataCallBack,
         comicsDataUseCase: ComicsDataUseCase,
         persistencyManager: PersistencyDataProtocol) {
        
        self.callBack = callBack
        self.characterDetailUseCase = characterDetailUseCase
        self.comicsCallBack = comicsCallBack
        self.comicsDataUseCase = comicsDataUseCase
        self.persistencyManager = persistencyManager
        
    }
    
    func getCharacterDetailData(with characterId: Int){
        callBack.commonResult(completion: dataCallBackListener)
        characterDetailUseCase.execute(useCaseCallBack: callBack, params: CharacterDataRequest(characterId: characterId))
    }
    
    func getComicsList(with characterId: Int) {
        comicsCallBack.commonResult(completion: comicsCallBackListener)
        comicsDataUseCase.execute(useCaseCallBack: comicsCallBack, params: ComicsDataRequest(characterId: characterId, dateRange: rangeCreator()))
    }
    
    func subscribeDataPublisher(with completion: @escaping (CharacterDetailViewData) -> Void) {
        dataBlock = completion
    }
    
    private func dataConverter(from response: CharacterDataResponse) {
        characterData = response.data.results[0]
        DispatchQueue.main.async {
            self.dataSetter(with: response)
        }
    }
    
    private func dataSetter(with response: CharacterDataResponse) {
        data = data
            .setCharacterDetailHeaderViewData(by: returnImageViewData(from: response))
            .setTitleBasedViewData(by: returnTitleBasedViewData(from: response))
        dataBlock?(data)
    }
    
    private func rangeCreator() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"

        let now = formatter.string(from: Date())
        return "2005-01-01,\(now)"
        
    }
    
    private func returnImageViewData(from response: CharacterDataResponse) -> CharacterDetailHeaderViewData {
        let data = response.data.results[0]
        return CharacterDetailHeaderViewData(imageContainerData: CustomImageViewComponentData(imageUrl: data.thumbnail.imageContentCreator()))
    }
    
    private func returnTitleBasedViewData(from response: CharacterDataResponse) -> [TitleBasedViewData] {
        let data = response.data.results[0]
        return [TitleBasedViewData(title: data.name, subTitle: data.description).setFavouriteButtonViewData(by: FavouriteButtonViewData(state: persistencyManager.checkExists(with: data), isFavouriteBlock: favouriteActionListener))]
    }
    
    private func comicsMapper(from response: ComicsDataResponse) {
        let comics = ComicsViewData(comicsData: response.data.results.map({ ContentDisplayerViewData(imageData: CustomImageViewComponentData(imageUrl: $0.thumbnail.imageContentCreator()), name: $0.title, isInfoViewHidden: true) }))
        data = data.setComicsViewData(by: comics.setTitle(by: (comics.comicsData.count > 0) ? TitleContainerViewData(title: "Comics") : nil))
        DispatchQueue.main.async {
            self.dataBlock?(self.data)
        }
    }
    
    private func favoriteItemOperations(with value: Bool) {
        guard let item = characterData else { return }
        value ? persistencyManager.addFavorite(with: item) : persistencyManager.removeFavourite(with: item)
    }
    
    // MARK: - Listeners
    private lazy var favouriteActionListener: BooleanCompletionBlock = { [weak self] value in
        self?.favoriteItemOperations(with: value)
    }
    
    private lazy var dataCallBackListener : (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self.dataConverter(from: response)
        }
    }
    
    private lazy var comicsCallBackListener : (Result<ComicsDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self.comicsMapper(from: response)
        }
    }
    
}
