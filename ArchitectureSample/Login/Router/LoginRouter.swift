//
//  LoginRouter.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit

protocol LoginRouterType: AnyObject {
    func routeToHome()
}

final class LoginRouter: LoginRouterType {
    
    // MARK: - Interface
    
    func routeToHome() {
        let viewController = HomeFactory.makeHomeViewController(window: window)
        window.rootViewController = viewController
    }
    
    
    // MARK: - Attribute
    
    private let window: UIWindow
    
    
    // MARK: - Initialization
    
    init(window: UIWindow) {
        self.window = window
    }
}
