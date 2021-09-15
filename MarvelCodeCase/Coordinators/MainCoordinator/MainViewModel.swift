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

class MainViewModel: BaseViewModelDelegate {
    
    // Mark: - Observers -
    private let disposeBag = DisposeBag()
    
    var dismissInformer: PublishSubject<Void>?
    
    private var paginationInfo = PaginationInfo()
    private let callBack: CharacterDataResponseCallBack
    private let characterListUseCase: CharactersDataUseCase
    
    init(callBack: CharacterDataResponseCallBack,
         characterListUseCase: CharactersDataUseCase) {
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
    
    // MARK: - Listeners
    private func listenerHandler(with result: Result<CharacterDataResponse, ErrorResponse>) {
        
        paginationInfo.fetching = false
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            print("")
        }
    }
    
    private lazy var datalistener: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        self?.listenerHandler(with: result)
    }
    
}

// MARK: - ItemCollectionComponentDelegate
//extension MainViewModel: ItemCollectionComponentDelegate {
//    func getNumberOfSection() -> Int {
//        <#code#>
//    }
//
//    func getItemCount(in section: Int) -> Int {
//        <#code#>
//    }
//
//    func getData(at index: Int) -> GenericDataProtocol {
//        <#code#>
//    }
//
//    func getMoreData() {
//        <#code#>
//    }
//
//    func isLoadingCell(for index: Int) -> Bool {
//        <#code#>
//    }
//
//    func selectedItem(at index: Int) {
//        <#code#>
//    }
//
//}
