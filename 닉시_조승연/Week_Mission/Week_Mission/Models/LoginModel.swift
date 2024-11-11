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
        saveToUserDefaults()
    }
    
    mutating func setPassword(newPassword: String) {
        self.password = newPassword
        saveToUserDefaults()
    }
    
    func validateLogin(inputId: String, inputPassword: String) -> Bool {
        return self.id == inputId && self.password == inputPassword
    }
    
    private func saveToUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(id, forKey: "userId")
        userDefaults.set(password, forKey: "userPassword")
    }
    
    static func loadFromUserDefaults() -> LoginModel? {
        let userDefaults = UserDefaults.standard
        if let savedId = userDefaults.string(forKey: "userId"),
           let savedPassword = userDefaults.string(forKey: "userPassword") {
            return LoginModel(id: savedId, password: savedPassword)
        }
        return nil
    }
    
    static func removeFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "userId")
        userDefaults.removeObject(forKey: "userPassword")
    }
}
