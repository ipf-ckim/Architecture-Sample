//
//  LoginStorage.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import Foundation

protocol LoginStateStorageType {
    var isLogin: Bool { get }
    func register(isLogin: Bool)
}

class LoginStateStorage: LoginStateStorageType {
    
    // MARK: - Interface
    
    var isLogin: Bool {
        storage.bool(forKey: isLoginKey)
    }
    
    func register(isLogin: Bool) {
        storage.set(isLogin, forKey: isLoginKey)
    }
    
    
    // MARK: - Attribute
    
    private let storage: UserDefaults
    private let isLoginKey = "isLogin"
    
    
    // MARK: - Initialization
    
    init(storage: UserDefaults = .standard) {
        self.storage = storage
    }
}
