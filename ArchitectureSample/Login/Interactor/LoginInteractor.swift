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
    
    // MARK: - Attribute
    
    private unowned let responseDelegate: any LoginResponseDelegate
    private let gateway: LoginGatewayType
    private let validator: LoginInputValidatorType
    private let encryptor: LoginPasswordEncryptorType
    
    
    // MARK: - Initialization
    
    init(
        responseDelegate: any LoginResponseDelegate,
        gateway: LoginGatewayType,
        validator: LoginInputValidatorType,
        encryptor: LoginPasswordEncryptorType
    ) {
        self.responseDelegate = responseDelegate
        self.gateway = gateway
        self.validator = validator
        self.encryptor = encryptor
    }
}


// MARK: - LoginRequestDelegate

extension LoginInteractor: LoginRequestDelegate {
    
    func login(request: LoginInteractor.Login.Request) {
        do {
            try validator.validateID(request.id)
            try validator.validatePassword(request.password)
            
            let securedPassword = encryptor.encrypt(request.password)
            gateway.login(id: request.id, password: securedPassword) { [weak self] result in
                let response: LoginInteractor.Login.Response
                switch result {
                case .success:
                    response = LoginInteractor.Login.Response(error: nil)
                case .failure(let error):
                    response = LoginInteractor.Login.Response(error: error)
                }
                
                self?.responseDelegate.presentHomeView(response: response)
            }
        } catch {
            let response = LoginInteractor.Login.Response(error: error)
            responseDelegate.presentHomeView(response: response)
        }
    }
    
    func registerLoginState(request: RegisterLoginState.Request) {
        gateway.registerLoginState(isLogin: request.isLogin)
    }
}
