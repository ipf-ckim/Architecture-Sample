//
//  LoginPasswordEncryptor.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/19.
//

import Foundation
import CommonCrypto

struct LoginPasswordEncryptor: LoginPasswordEncryptorType {
    
    func encrypt(_ password: String) -> String {
        guard let data = password.data(using: .utf8) else {
            return password
        }
        
        return data.withUnsafeBytes { pointer -> String in
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
            CC_SHA512(pointer.baseAddress, CC_LONG(data.count), &digest)
            return digest
                .map { String(format:"%02x", $0) }
                .joined()
                .uppercased()
        }
    }
}
