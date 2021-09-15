//
//  AppCoordinatorAssembler.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AppCoordinatorAssembler: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init).inObjectScope(.container)
        container.autoregister(AppViewModel.self, initializer: AppViewModel.init).inObjectScope(.container)
        
    }
    
}
