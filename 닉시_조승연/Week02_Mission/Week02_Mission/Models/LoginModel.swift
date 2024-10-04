//
//  LoginModel.swift
//  Week02_Mission
//
//  Created by 조승연 on 9/30/24.
//

import Foundation

struct LoginModel {
    private var id: String
    private var password: String
    
    init(id: String, password: String) {
        self.id = id
        self.password = password
    }
    
    func getId() -> String {
        return id
    }
    
    func getPassword() -> String {
        return password
    }
    
    mutating func setId(newId: String) {
        self.id = newId
    }
    
    mutating func setPassword(newPassword: String) {
        self.password = newPassword
    }
    
    func validateLogin(inputId: String, inputPassword: String) -> Bool {
        return self.id == inputId && self.password == inputPassword
    }
}
