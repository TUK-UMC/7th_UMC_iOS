//
//  UserDefaultsModel.swift
//  week03_study
//
//  Created by nelime on 10/11/24.
//

import Foundation

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
}
