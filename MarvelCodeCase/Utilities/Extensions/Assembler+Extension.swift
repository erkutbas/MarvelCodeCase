//
//  Assembler+Extension.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation
import Swinject

extension Assembler {
    
    static let sharedAssembler: Assembler = {
       
        let container = Container()
        
        let assembler = Assembler([FavouritesAssembler(),
                                   ClientSideAssembler(),
                                   CharacterDataResponsibleAssember(),
                                   NetworkAssembler(),
                                   AppCoordinatorAssembler(),
                                   SplashViewAssembler(),
                                   MainViewAssembler(),
                                   CharacterDetailAssembler()],
                                  container: container)
        return assembler
        
    }()
    
}

