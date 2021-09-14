//
//  AssemblerResolverDelegate.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

import Swinject

protocol AssemblerResolverDelegate {
    
}

extension AssemblerResolverDelegate {
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}
