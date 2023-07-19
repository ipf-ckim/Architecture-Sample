//
//  LoginFactory.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit

enum LoginFactory {
    
    static func makeLoginViewController(window: UIWindow) -> UIViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter()
        presenter.presentationDelegate = viewController
        viewController.actionDelegate = presenter
        
        let service = LoginService()
        let storage = LoginStateStorage()
        let validator = LoginInputValidator()
        let encryptor = LoginPasswordEncryptor()
        let interactor = LoginInteractor(
            service: service,
            loginStateStorage: storage,
            validator: validator,
            encryptor: encryptor
        )
        presenter.requestDelegate = interactor
        interactor.responseDelegate = presenter
        
        let router = LoginRouter(window: window)
        presenter.router = router
        
        return viewController
    }
}
