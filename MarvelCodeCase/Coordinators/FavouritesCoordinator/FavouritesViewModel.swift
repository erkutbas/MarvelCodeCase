//
//  FavouritesViewModel.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation
import RxSwift

class FavouritesViewModel: BaseViewModelDelegate {
    
    var dismissInformer: PublishSubject<Void>? = PublishSubject<Void>()
    private var selectedItemBlock: CollectionSelectedItemBlock?
    private var collectionState: CollectionLoadingStateBlock?
    
    private let persistencyManager: PersistencyDataProtocol
    private let mainViewDataFormatter: MainViewDataFormatter
    
    init(persistencyManager: PersistencyDataProtocol,
         mainViewDataFormatter: MainViewDataFormatter) {
        self.persistencyManager = persistencyManager
        self.mainViewDataFormatter = mainViewDataFormatter
    }
    
    func getData() {
        collectionState?(.loading)
        persistencyManager.getFavoriteItems { [weak self] data in
            guard let self = self else { return }
            self.mainViewDataFormatter.setData(with: data)
            self.collectionState?(.done)
        }
    }
    
    func listenCollectionState(completion: @escaping CollectionLoadingStateBlock) {
        collectionState = completion
    }
    
    func listenSelectedItem(with completion: @escaping ((Int) -> Void)) {
        selectedItemBlock = completion
    }
    
}

// MARK: - ItemCollectionComponentDelegate
extension FavouritesViewModel: ItemCollectionComponentDelegate {
   
    func getNumberOfSection() -> Int {
        return mainViewDataFormatter.getNumberOfSection()
    }

    func getItemCount(in section: Int) -> Int {
        return mainViewDataFormatter.getCount()
    }

    func getData(at index: Int) -> GenericDataProtocol? {
        return mainViewDataFormatter.getData(at: index)
    }

    func getMoreData() {
        // redundat
    }

    func isLoadingCell(for index: Int) -> Bool {
        return false
    }

    func selectedItem(at index: Int) {
        selectedItemBlock?(mainViewDataFormatter.getRawData(at: index).id)
    }
    
}
