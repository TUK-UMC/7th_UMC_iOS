//
//  UserResponseModel.swift
//  week08_study
//
//  Created by nelime on 11/23/24.
//

import Foundation

struct UserResponseModel: Codable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
}
