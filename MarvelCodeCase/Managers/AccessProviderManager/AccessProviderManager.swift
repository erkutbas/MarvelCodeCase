//
//  AccessProviderManager.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import Foundation
import NetworkLayer
import CommonCrypto

class AccessProviderManager: AccessProviderProtocol {
    
    private var hash = ""
    private let publicKey = "b1b6a2c675b36a5e44800a4fbaa2fb8e"
    private let privateKey = "d95ba5936b62034a1f89e94f4c096b507b0dadf8"
    
    func returnUniqueData() -> String {
        let uniqueId = "\(UUID())"
        hash = MD5(uniqueId: uniqueId).map { String(format: "%02hhx", $0) }.joined()
        return uniqueId
    }
    
    func returnApiKey() -> String {
        return publicKey
    }
    
    func returnHash() -> String {
        return hash
    }
    
    private func MD5(uniqueId: String) -> Data {
        
        let value = "\(uniqueId)\(privateKey)\(publicKey)"
        
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = value.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        
        return digestData
    }
    
    
}
