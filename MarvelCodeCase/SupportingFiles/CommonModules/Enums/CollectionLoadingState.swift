//
//  CollectionLoadingState.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

enum CollectionLoadingState {
    case loading
    case done
    case reloadIndex(IndexPath)
}
