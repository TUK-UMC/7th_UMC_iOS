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
        saveToUserDefaults()  // ID가 변경되면 UserDefaults에 저장
    }
    
    mutating func setPassword(newPassword: String) {
        self.password = newPassword
        saveToUserDefaults()  // 비밀번호가 변경되면 UserDefaults에 저장
    }
    
    func validateLogin(inputId: String, inputPassword: String) -> Bool {
        return self.id == inputId && self.password == inputPassword
    }
    
    // UserDefaults에 로그인 정보 저장
    private func saveToUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(id, forKey: "userId")
        userDefaults.set(password, forKey: "userPassword")
    }
    
    // UserDefaults에서 로그인 정보 불러오기
    static func loadFromUserDefaults() -> LoginModel? {
        let userDefaults = UserDefaults.standard
        if let savedId = userDefaults.string(forKey: "userId"),
           let savedPassword = userDefaults.string(forKey: "userPassword") {
            return LoginModel(id: savedId, password: savedPassword)
        }
        return nil
    }
    
    // UserDefaults에서 로그인 정보 삭제
    static func removeFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "userId")
        userDefaults.removeObject(forKey: "userPassword")
    }
}
