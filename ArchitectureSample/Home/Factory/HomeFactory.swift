//
//  HomeFactory.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import UIKit

enum HomeFactory {
    
    static func makeHomeViewController(window: UIWindow) -> UIViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        viewController.actionDelegate = presenter
        
        let router = HomeRouter(window: window)
        presenter.router = router
        
        return viewController
    }
}
