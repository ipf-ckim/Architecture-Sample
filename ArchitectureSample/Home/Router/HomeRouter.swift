//
//  HomeRouter.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit

protocol HomeRouterType: AnyObject {
    func routeToLogin()
}

final class HomeRouter: HomeRouterType {
    
    // MARK: - Interface
    
    func routeToLogin() {
        let viewController = LoginFactory.makeLoginViewController(window: window)
        window.rootViewController = viewController
    }
    
    
    // MARK: - Attribute
    
    private let window: UIWindow
    
    
    // MARK: - Initialization
    
    init(window: UIWindow) {
        self.window = window
    }
}
