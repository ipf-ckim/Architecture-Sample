//
//  LoginPresenter.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit

// MARK: - I/O Port

protocol LoginActionDelegate: AnyObject {
    func loginViewDidAppear()
    func loginButtonTouched(id: String, password: String)
}

protocol LoginPresentationDelegate: AnyObject {
    func showErrorAlert(viewModel: LoginPresenter.Login.ViewModel)
}


// MARK: - Presenter

final class LoginPresenter {
    
    // MARK: - Attribute
    
    private unowned let presentationDelegate: any LoginPresentationDelegate
    private lazy var requestDelegate: any LoginRequestDelegate = LoginInteractor(
        responseDelegate: self,
        gateway: LoginGateway(service: LoginService(), storage: LoginStateStorage()),
        validator: LoginInputValidator(),
        encryptor: LoginPasswordEncryptor()
    )
    private let router: any LoginRouterType
    
    
    // MARK: - Initialization
    
    init(presentationDelegate: any LoginPresentationDelegate, router: any LoginRouterType) {
        self.presentationDelegate = presentationDelegate
        self.router = router
    }
}


// MARK: - LoginActionDelegate

extension LoginPresenter: LoginActionDelegate {
    
    func loginViewDidAppear() {
        let request = LoginInteractor.RegisterLoginState.Request(isLogin: false)
        requestDelegate.registerLoginState(request: request)
    }
    
    func loginButtonTouched(id: String, password: String) {
        let request = LoginInteractor.Login.Request(id: id, password: password)
        requestDelegate.login(request: request)
    }
}


// MARK: - LoginResponseDelegate

extension LoginPresenter: LoginResponseDelegate {
    
    func presentHomeView(response: LoginInteractor.Login.Response) {
        requestDelegate.registerLoginState(request: .init(isLogin: response.error == nil))
        
        guard let error = response.error else {
            router.routeToHome()
            return
        }
        
        let viewModel = LoginPresenter.Login.ViewModel(
            errorTitle: "Login Failed",
            errorMessage: error.localizedDescription
        )
        presentationDelegate.showErrorAlert(viewModel: viewModel)
    }
}

