//
//  CharacterDataResponsibleAssember.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MarvelDomainLayer
import MarvelDataLayer

class CharacterDataResponsibleAssember: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(MarvelCharacterOperationsProtocol.self, initializer: MarvelCharacterDataRepository.init).inObjectScope(.weak)
        container.autoregister(MarvelCharacterDataApiRemoteProtocol.self, initializer: MarvelCharacterDataApiRemote.init).inObjectScope(.weak)
        container.autoregister(MarvelCharacterServiceProviderManagerProtocol.self, initializer: MarvelCharacterServiceProviderManager.init).inObjectScope(.weak)

    }
    
}
