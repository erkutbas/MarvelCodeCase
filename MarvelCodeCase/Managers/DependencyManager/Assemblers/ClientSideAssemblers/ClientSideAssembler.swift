//
//  ClientSideAssembler.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import MarvelDomainLayer

class ClientSideAssembler: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(PersistencyDataProtocol.self, initializer: PersistencyDataManager.init).inObjectScope(.container)
        container.autoregister(LottieManagerProtocol.self, initializer: LottieManager.init).inObjectScope(.container)
        container.autoregister(UseCaseListener.self, initializer: UseCaseListenerManager.init).inObjectScope(.container)

    }
    
}
