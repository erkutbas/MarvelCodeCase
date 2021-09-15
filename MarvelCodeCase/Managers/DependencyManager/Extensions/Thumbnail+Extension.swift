//
//  Thumbnail+Extension.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import MarvelDomainLayer

extension Thumbnail {
    
    func imageContentCreator() -> String {
        return "\(self.path)/portrait_uncanny.\(self.thumbnailExtension)"
    }
    
}
