//
//  CharacterDetailAssembler.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MarvelDomainLayer

class CharacterDetailAssembler: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(CharacterDetailCoordinator.self, initializer: CharacterDetailCoordinator.init).inObjectScope(.weak)
        container.autoregister(CharacterDetailViewModel.self, initializer: CharacterDetailViewModel.init).inObjectScope(.weak)
        
        container.autoregister(CharacterDetailDataManagerProtocol.self, initializer: CharacterDetailDataManager.init).inObjectScope(.weak)
        
        container.autoregister(ComicsDataUseCase.self, initializer: ComicsDataUseCase.init).inObjectScope(.transient)
        container.autoregister(ComiscDataCallBack.self, initializer: ComiscDataCallBack.init).inObjectScope(.transient)
        container.autoregister(CharacterDetailUseCase.self, initializer: CharacterDetailUseCase.init).inObjectScope(.transient)

    }
    
}

