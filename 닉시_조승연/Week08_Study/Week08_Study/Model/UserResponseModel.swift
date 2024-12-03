//
//  UserResponseModel.swift
//  Week08_Study
//
//  Created by 조승연 on 11/19/24.
//

import Foundation

struct UserResponseModel: Codable {
    let id: Int
    let email : String
    let password : String
    let name : String
    let role : String
    let avatar : String
}
