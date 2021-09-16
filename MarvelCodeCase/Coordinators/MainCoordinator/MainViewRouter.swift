//
//  MainViewRouter.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

protocol MainViewRouter: AnyObject {
    
    func pushDetail(with id: Int)
    
    func pushFavourites()
    
}
