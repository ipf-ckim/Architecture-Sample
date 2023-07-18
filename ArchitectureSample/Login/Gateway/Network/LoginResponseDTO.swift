//
//  LoginResponseDTO.swift
//  ArchitectureSample
//
//  Created by Chamsol Kim on 2023/07/18.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let accessKey: String
    let code: Int
    let message: String
    let user: UserDTO
    
    struct UserDTO: Decodable {
        let id: Int
        let email: String
        let isAutoCreated: Int
        let loginId: String
        let name: String
        let orgIdx: Int
        let phoneticName: String
        let profileImg: String?
        let region: String
        let school: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case email
            case isAutoCreated = "is_auto_created"
            case loginId = "loginid"
            case name
            case orgIdx = "org_idx"
            case phoneticName = "phonetic_name"
            case profileImg = "profile_img"
            case region = "region"
            case school = "school"
        }
    }
}
