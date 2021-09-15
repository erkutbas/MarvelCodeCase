//
//  MarvelCodeCaseColor.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

enum MarvelCodeCaseColor: GenericValueProtocol {
    
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
        case .marvelRed:
            return #colorLiteral(red: 0.7843137255, green: 0.2117647059, blue: 0.2117647059, alpha: 1)
        }
    }
    
    case marvelRed
}
