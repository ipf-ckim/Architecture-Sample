//
//  LoginInteractor+Model.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import Foundation

extension LoginInteractor {
    
    enum Login {
        
        struct Request {
            let id: String
            let password: String
        }
        
        struct Response {
            let error: Error?
        }
    }
    
    enum RegisterLoginState {
        
        struct Request {
            let isLogin: Bool
        }
    }
}
