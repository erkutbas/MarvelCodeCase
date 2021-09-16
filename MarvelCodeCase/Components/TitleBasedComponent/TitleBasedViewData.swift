//
//  TitleBasedViewData.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class TitleBasedViewData {
    
    private(set) var title: String
    private(set) var font: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
    private(set) var subTitle: String?
    private(set) var subTitleFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    private(set) var favouriteButtonData: FavouriteButtonViewData?
    
    init(title: String,
         font: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold),
         subTitle: String?,
         subTitleFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)) {
        
        self.title = title
        self.font = font
        self.subTitle = subTitle
        self.subTitleFont = subTitleFont
        
    }
    
    func setFavouriteButtonViewData(by value: FavouriteButtonViewData) -> Self {
        favouriteButtonData = value
        return self
    }
    
}
