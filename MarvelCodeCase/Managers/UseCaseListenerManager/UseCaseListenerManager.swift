//
//  UseCaseListenerManager.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 16.09.2021.
//

import Foundation
import MarvelDomainLayer

class UseCaseListenerManager: UseCaseListener {
    
    private let lottieManager: LottieManagerProtocol
    
    init(lottieManager: LottieManagerProtocol) {
        self.lottieManager = lottieManager
    }
    
    func onPreExecute() {
        lottieManager.onPreExecute()
    }
    
    func onPostExecute() {
        lottieManager.onPostExecute()
    }
    
}
