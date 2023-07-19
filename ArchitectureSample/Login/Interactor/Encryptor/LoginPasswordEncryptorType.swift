//
//  LoginPasswordEncryptorType.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/19.
//

import Foundation

protocol LoginPasswordEncryptorType {
    func encrypt(_ password: String) -> String
}
