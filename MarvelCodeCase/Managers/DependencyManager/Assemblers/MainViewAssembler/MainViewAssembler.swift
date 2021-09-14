//
//  MainViewAssembler.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class MainViewAssembler: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(MainCoordinator.self, initializer: MainCoordinator.init).inObjectScope(.container)
        container.autoregister(MainViewModel.self, initializer: MainViewModel.init).inObjectScope(.container)

    }
    
}
