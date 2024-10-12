//
//  LoginModel.swift
//  week01_mission
//
//  Created by nelime on 9/28/24.
//

import Foundation

// LoginModel class to manage id and password.
class LoginModel {
    private let userDefaults = UserDefaults.standard
    private let userID: String = "userIDText"
    private let userPW: String = "userPWText"

    
    public func saveUserID(_ text: String) {
        userDefaults.set(text, forKey: userID)
    }
    public func loadUserID() -> String? {
        return userDefaults.string(forKey: userID)
    }
    
    
    public func saveUserPW(_ text: String) {
        userDefaults.set(text, forKey: userPW)
    }
    public func loadUserPW() -> String? {
        return userDefaults.string(forKey: userPW)
    }
    
}


