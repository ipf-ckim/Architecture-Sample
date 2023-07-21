//
//  LoginGateway.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/19.
//

import Foundation

protocol LoginGatewayType: AnyObject {
    func login(id: String, password: String, completion: @escaping (Result<Void, Error> )-> Void)
    func registerLoginState(isLogin: Bool)
}

final class LoginGateway: LoginGatewayType {
    
    // MARK: - Interface
    
    func login(id: String, password: String, completion: @escaping (Result<Void, Error> )-> Void) {
        service.login(id: id, password: password) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func registerLoginState(isLogin: Bool) {
        storage.register(isLogin: isLogin)
    }
    
    
    // MARK: - Attribute
    
    private let service: LoginServiceType
    private let storage: LoginStateStorageType
    
    
    // MARK: - Initialization
    
    init(service: LoginServiceType, storage: LoginStateStorageType) {
        self.service = service
        self.storage = storage
    }
}
