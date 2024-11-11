import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
        setupActions()
    }

    private func setupLoginView() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }

    @objc private func handleLogin() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            print("이메일 또는 비밀번호를 입력하세요.")
            return
        }

        // 로그인 성공 시 이메일과 비밀번호를 UserDefaults에 저장
        saveLoginInfo(email: email, password: password)

        // BaseTabBarController로 이동
        let baseTabBarController = BaseTabBarController()
        baseTabBarController.modalPresentationStyle = .fullScreen
        present(baseTabBarController, animated: true, completion: nil)
    }

    private func saveLoginInfo(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        print("이메일과 비밀번호가 저장되었습니다.")
    }
}
