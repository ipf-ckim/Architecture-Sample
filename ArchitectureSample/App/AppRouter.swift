//
//  AppRouter.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit

final class AppRouter {
    
    // MARK: - Interface
    
    func route() {
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        
        let viewController: UIViewController
        if isLogin {
            viewController = HomeFactory.makeHomeViewController(window: window)
        } else {
            viewController = LoginFactory.makeLoginViewController(window: window)
        }
        
        window.rootViewController = viewController
    }
    
    
    // MARK: - Attribute
    
    private let window: UIWindow
    
    
    // MARK: - Initialization
    
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
}
