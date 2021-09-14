//
//  ViewControllerTypeProtocol.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

protocol ViewControllerTypeProtocol {
    var viewTitle: String? { get }
}

extension ViewControllerTypeProtocol {
    func returnValue() -> String? {
        return viewTitle
    }
}
