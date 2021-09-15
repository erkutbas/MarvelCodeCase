//
//  GenericDataProtocol.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation

protocol GenericDataProtocol {
    
}

protocol GenericRowDataProtocol: GenericDataProtocol {
    
    var itemId: Int64 { get }
    
}
