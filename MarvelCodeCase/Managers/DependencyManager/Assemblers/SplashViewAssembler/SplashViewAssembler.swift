//
//  SplashViewAssembler.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class SplashViewAssembler: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(SplashCoordinator.self, initializer: SplashCoordinator.init).inObjectScope(.weak)
        container.autoregister(SplashScreenViewModel.self, initializer: SplashScreenViewModel.init).inObjectScope(.weak)
        
    }
    
}
