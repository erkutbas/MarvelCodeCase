//
//  CharacterDetailView.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class CharacterDetailView: GenericBaseView<CharacterDetailViewData> {
    
    private lazy var collectionView: UICollectionView = {
        let layout = CharacterDetailHeeaderFlowLayout()
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 500)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(CharacterDetailInfoCellView.self)
        collection.register(CharacterDetailHeaderResuableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharacterDetailHeaderResuableView.identifier)
        collection.register(CharacterDetailFooterResuableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CharacterDetailFooterResuableView.identifier)
        return collection
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    
    private func setData(to header: CharacterDetailHeaderResuableView) {
        guard let data = returnData(), let headerViewData = data.headerViewData else { return }
        header.setRowData(data: headerViewData)
    }
    
    private func setData(to footer: CharacterDetailFooterResuableView) {
        guard let data = returnData(), let comicsData = data.comicsViewData else { return }
        footer.setRowData(data: comicsData)
    }

    override func loadDataToView() {
        super.loadDataToView()
        collectionView.reloadData()
    }
    
    private func getNumberOfItems() -> Int {
        guard let data = returnData() else { return 0 }
        return data.titleBasedViewDataList.count
    }
    
    private func getItem(at index: IndexPath) -> TitleBasedViewData {
        guard let data = returnData() else { fatalError("If data does not exist, this method is impossible to get called.") }
        return data.titleBasedViewDataList[index.row]
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension CharacterDetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CharacterDetailHeaderResuableView.identifier, for: indexPath) as? CharacterDetailHeaderResuableView else { return UICollectionReusableView() }
            setData(to: header)
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CharacterDetailFooterResuableView.identifier, for: indexPath) as? CharacterDetailFooterResuableView else { return UICollectionReusableView() }
            setData(to: header)
            return header
        default:
            assert(false, "Unexpected element kind")
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterDetailInfoCellView.identifier, for: indexPath) as? CharacterDetailInfoCellView else { return UICollectionViewCell() }
        cell.setRowData(data: getItem(at: indexPath))
        return cell
    }
    
}

