//
//  LoginService.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import Foundation

protocol LoginServiceType {
    func login(id: String, password: String, completion: @escaping (Result<LoginResponseDTO, Error>) -> Void)
}

class LoginService: LoginServiceType {
    
    func login(id: String, password: String, completion: @escaping (Result<LoginResponseDTO, Error>) -> Void) {
        do {
            let response = try JSONDecoder().decode(LoginResponseDTO.self, from: stubResponseData)
            completion(.success(response))
        } catch {
            completion(.failure(error))
        }
    }
}


// MARK: - Stub

private extension LoginService {
    
    var stubResponseData: Data {
        let jsonObject: [String: Any] = [
            "accessKey": "5c19b046a2b040d511bfbf99668717c5",
            "code": 200,
            "message": "OK",
            "user": [
                "email": "ckim@iportfolio.co.kr",
                "id": 112293,
                "is_auto_created": 0,
                "loginid": "ckim",
                "name": "Chamsol",
                "org_idx": 234,
                "phonetic_name": "Kim",
                "profile_img": nil,
                "region": "JAPAN",
                "school": "IPFDASH",
            ]
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: jsonObject)
        return data ?? Data()
    }
}
