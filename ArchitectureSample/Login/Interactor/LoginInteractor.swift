//
//  LoginInteractor.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import Foundation

// MARK: - Delegates

protocol LoginRequestDelegate: AnyObject {
    func login(request: LoginInteractor.Login.Request)
    func registerLoginState(request: LoginInteractor.RegisterLoginState.Request)
}

protocol LoginResponseDelegate: AnyObject {
    func presentHomeView(response: LoginInteractor.Login.Response)
}


// MARK: - Interactor

final class LoginInteractor {
    
    // MARK: - Interface
    
    var responseDelegate: LoginResponseDelegate?
    
    
    // MARK: - Attribute
    
    private let loginService: LoginServiceType
    private let loginStateStorage: LoginStateStorageType
    
    
    // MARK: - Initialization
    
    init(loginService: LoginServiceType, loginStateStorage: LoginStateStorage) {
        self.loginService = loginService
        self.loginStateStorage = loginStateStorage
    }
}


// MARK: - LoginRequestDelegate

extension LoginInteractor: LoginRequestDelegate {
    
    func login(request: LoginInteractor.Login.Request) {
        loginService.login(id: request.id, password: request.password) { [weak self] result in
            let response: LoginInteractor.Login.Response
            switch result {
            case .success:
                response = LoginInteractor.Login.Response(error: nil)
            case .failure(let error):
                response = LoginInteractor.Login.Response(error: error)
            }
            
            self?.responseDelegate?.presentHomeView(response: response)
        }
    }
    
    func registerLoginState(request: RegisterLoginState.Request) {
        loginStateStorage.register(isLogin: request.isLogin)
    }
}
