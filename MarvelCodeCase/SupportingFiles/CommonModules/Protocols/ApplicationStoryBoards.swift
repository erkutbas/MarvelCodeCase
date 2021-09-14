//
//  ApplicationStoryBoards.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

enum ApplicationStoryBoards: GenericValueProtocol {
    
    typealias Value = String
    
    case main
    case splashScreen
    
    var value: String {
        switch self {
        case .main:
            return "Main"
        case .splashScreen:
            return "SplashViewStoryBoard"
        }
    }
    
}
