//
//  HomePresenter.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import Foundation

// MARK: - Delegates

protocol HomeActionDelegate: AnyObject {
    func logoutButtonTouched()
}


// MARK: - Presenter

final class HomePresenter {
    
    // MARK: - Interface
    
    var router: (any HomeRouterType)?
}


// MARK: - HomeActionDelegate

extension HomePresenter: HomeActionDelegate {
    
    func logoutButtonTouched() {
        router?.routeToLogin()
    }
}
