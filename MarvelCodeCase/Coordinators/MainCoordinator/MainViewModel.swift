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
typealias CollectionSelectedItemBlock = (Int) -> Void

class MainViewModel: BaseViewModelDelegate {

    var dismissInformer: PublishSubject<Void>?
    
    private let disposeBag = DisposeBag()
    private var collectionState: CollectionLoadingStateBlock?
    private var selectedItemBlock: CollectionSelectedItemBlock?
    
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
        characterListUseCase.execute(useCaseCallBack: callBack, params: CharacterDataRequest(offset: mainViewDataFormatter.paginationData.offset))
        
    }
    
    func listenCollectionState(completion: @escaping CollectionLoadingStateBlock) {
        collectionState = completion
    }
    
    func refreshData() {
        mainViewDataFormatter.refresh()
        collectionState?(.done)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getData()
        }
    }
    
    func listenSelectedItem(with completion: @escaping ((Int) -> Void)) {
        selectedItemBlock = completion
    }
    
    // MARK: - Listeners
    private func listenerHandler(with result: Result<CharacterDataResponse, ErrorResponse>) {
        
        mainViewDataFormatter.paginationData.fetching = false
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            print("response :\(response)")
            mainViewDataFormatter.setData(with: response)
            collectionState?(.done)
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
        guard mainViewDataFormatter.paginationData.checkLoadingMore() else { return }
        mainViewDataFormatter.paginationData.nextOffset()
        getData(with: true)
    }

    func isLoadingCell(for index: Int) -> Bool {
        print("isLoadingCell index : \(index)")
        return index >= mainViewDataFormatter.getCount()
    }

    func selectedItem(at index: Int) {
        selectedItemBlock?(mainViewDataFormatter.getRawData(at: index).id)
    }

}
