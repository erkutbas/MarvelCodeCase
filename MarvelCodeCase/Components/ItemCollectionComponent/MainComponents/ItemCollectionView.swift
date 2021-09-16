//
//  ItemCollectionView.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class ItemCollectionComponent: GenericBaseView<ItemCollectionViewData> {
    
    private weak var delegate: ItemCollectionComponentDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.keyboardDismissMode = .onDrag
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(ContentDisplayerCollectionViewCell.self)
        collection.genericRegisterCell(LoadingCellView.self)
        return collection
    }()
    
    private lazy var pullToRefresh: UIRefreshControl = {
        let temp = UIRefreshControl()
        temp.addTarget(self, action: .pullToRefreshAction, for: .valueChanged)
        return temp
    }()

    override func setupViews() {
        super.setupViews()
        addPullToRefresh()
    }
    
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
    
    func addPullToRefresh() {
        guard let data = returnData(), data.isRefreshingSupported else { return }
        collectionView.refreshControl = pullToRefresh
        
    }
    
    func setupDelegation(with delegate: ItemCollectionComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadCollectionComponent() {
        DispatchQueue.main.async { [weak self] in
            self?.pullToRefresh.endRefreshing()
            self?.collectionView.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
    func removeItem(at indexPath: IndexPath, completion: @escaping (Bool) -> Void) {
        collectionView.performBatchUpdates({ [weak self] in
            self?.collectionView.deleteItems(at: [indexPath])
        }, completion: completion)
    }
    
    func reloadItem(at indexPath: IndexPath) {
        collectionView.performBatchUpdates { [weak self] in
            //self?.collectionView.reloadItems(at: [indexPath])
            self?.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        }
    }
    
    @objc fileprivate func pullToRefreshAction(_ sender: UIRefreshControl) {
        pullToRefresh.beginRefreshing()
        print("pullToRefresh.isRefreshing : \(pullToRefresh.isRefreshing)")
        guard pullToRefresh.isRefreshing else { return }
        delegate?.refreshCollectionView()
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension ItemCollectionComponent: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.getNumberOfSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getItemCount(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError() }
            return cell
        } else {
            guard let data = delegate?.getData(at: indexPath.row) else { fatalError() }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentDisplayerCollectionViewCell.identifier, for: indexPath) as? ContentDisplayerCollectionViewCell else { fatalError() }
            cell.setRowData(data: data)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ContentDisplayerCollectionViewCell else { return }
        isUserInteractionEnabled = false
        cell.startPressedAnimationCommon { [weak self](finish) in
            self?.delegate?.selectedItem(at: indexPath.row)
            self?.isUserInteractionEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ItemCollectionComponent: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 50) / 3
        return CGSize(width: width, height: 250)
    }
    
}

// MARK: - Selector
fileprivate extension Selector {
    static let pullToRefreshAction = #selector(ItemCollectionComponent.pullToRefreshAction)
}
