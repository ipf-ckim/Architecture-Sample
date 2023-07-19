//
//  LoginInputValidatorType.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/19.
//

import Foundation

protocol LoginInputValidatorType {
    func validateID(_ id: String) throws
    func validatePassword(_ password: String) throws
}
