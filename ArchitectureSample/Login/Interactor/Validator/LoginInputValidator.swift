//
//  LoginInputValidator.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/19.
//

import Foundation

enum LoginInputValidationError: Error {
    case invalidID
    case invalidPassword
}

extension LoginInputValidationError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidID:
            return "Invalid ID Error"
        case .invalidPassword:
            return "Invalid Password Error"
        }
    }
}

struct LoginInputValidator: LoginInputValidatorType {
    
    func validateID(_ id: String) throws {
        let pattern = "^[A-Za-z][A-Za-z0-9]{3,19}$"
        if id.range(of: pattern, options: .regularExpression) == nil {
            throw LoginInputValidationError.invalidID
        }
    }
    
    func validatePassword(_ password: String) throws {
        let pattern = "((?=.*[A-Za-z])(?=.*[0-9]).{6,40})"
        if password.range(of: pattern, options: .regularExpression) == nil {
            throw LoginInputValidationError.invalidPassword
        }
    }
}
