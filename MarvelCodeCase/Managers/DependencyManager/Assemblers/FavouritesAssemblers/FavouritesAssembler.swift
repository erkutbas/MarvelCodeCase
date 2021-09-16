//
//  FavouritesAssembler.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MarvelDomainLayer

class FavouritesAssembler: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(FavouritesCoordinator.self, initializer: FavouritesCoordinator.init).inObjectScope(.weak)
        container.autoregister(FavouritesViewModel.self, initializer: FavouritesViewModel.init).inObjectScope(.weak)
        
    }
    
}

