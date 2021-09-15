//
//  MainViewModel.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import MarvelDomainLayer
import RxSwift
import NetworkEntityLayer

typealias CollectionLoadingStateBlock = (CollectionLoadingState) -> Void

class MainViewModel: BaseViewModelDelegate {

    var dismissInformer: PublishSubject<Void>?
    
    private let disposeBag = DisposeBag()
    private var collectionState: CollectionLoadingStateBlock?
    
    private var paginationInfo = PaginationInfo()
    private var mainViewDataFormatter: MainViewDataFormatter
    private let callBack: CharacterDataResponseCallBack
    private let characterListUseCase: CharactersDataUseCase
    
    init(mainViewDataFormatter: MainViewDataFormatter,
         callBack: CharacterDataResponseCallBack,
         characterListUseCase: CharactersDataUseCase) {
        self.mainViewDataFormatter = mainViewDataFormatter
        self.callBack = callBack
        self.characterListUseCase = characterListUseCase
    }

    func getData(with pagination: Bool = false) {
        if !pagination {
            //updateCollectionState(with: .loading)
        }
        callBack.commonResult(completion: datalistener)
        characterListUseCase.execute(useCaseCallBack: callBack, params: CharacterDataRequest())
        
    }
    
    func listenCollectionState(completion: @escaping CollectionLoadingStateBlock) {
        collectionState = completion
    }
    
    // MARK: - Listeners
    private func listenerHandler(with result: Result<CharacterDataResponse, ErrorResponse>) {
        
        paginationInfo.fetching = false
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            print("")
            mainViewDataFormatter.data = response.data
        }
    }
    
    private lazy var datalistener: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        self?.listenerHandler(with: result)
    }
    
}

// MARK: - ItemCollectionComponentDelegate
extension MainViewModel: ItemCollectionComponentDelegate {
    func getNumberOfSection() -> Int {
        return mainViewDataFormatter.getNumberOfSection()
    }

    func getItemCount(in section: Int) -> Int {
        return mainViewDataFormatter.getNumbeOfItem(in: section)
    }

    func getData(at index: Int) -> GenericDataProtocol? {
        return mainViewDataFormatter.getData(at: index)
    }

    func getMoreData() {
        
    }

    func isLoadingCell(for index: Int) -> Bool {
        return false
    }

    func selectedItem(at index: Int) {
        
    }

}
