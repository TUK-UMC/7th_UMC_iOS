import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
        setupActions()
        checkExistingLogin()
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
        loginView.kakaoLoginButton.addTarget(self, action: #selector(handleKakaoLogin), for: .touchUpInside)
    }

    private func checkExistingLogin() {
        if let nickname = KeychainHelper.shared.get(key: "kakaoNickname") {
            print("이미 로그인된 사용자: \(nickname)")
            navigateToBaseTabBar()
        }
    }

    @objc private func handleLogin() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            showErrorAlert(message: "이메일 또는 비밀번호를 입력하세요.")
            return
        }

        saveLoginInfo(email: email, password: password)
        navigateToBaseTabBar()
    }

    @objc private func handleKakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                self?.processKakaoLogin(oauthToken: oauthToken, error: error)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                self?.processKakaoLogin(oauthToken: oauthToken, error: error)
            }
        }
    }

    private func processKakaoLogin(oauthToken: OAuthToken?, error: Error?) {
        if let error = error {
            showErrorAlert(message: "카카오톡 로그인에 실패했습니다. 다시 시도해주세요.")
            print("카카오톡 로그인 실패: \(error.localizedDescription)")
            return
        }
        guard let token = oauthToken else { return }

        UserApi.shared.me { [weak self] (user, error) in
            if let error = error {
                print("사용자 정보 요청 실패: \(error.localizedDescription)")
                return
            }
            if let nickname = user?.kakaoAccount?.profile?.nickname {
                print("카카오 사용자 정보 - 닉네임: \(nickname)")

                KeychainHelper.shared.save(key: "kakaoAccessToken", value: token.accessToken)
                KeychainHelper.shared.save(key: "kakaoNickname", value: nickname)

                self?.navigateToBaseTabBar()
            }
        }
    }

    private func saveLoginInfo(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        print("이메일과 비밀번호가 저장되었습니다.")
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "로그인 오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true, completion: nil)
    }

    private func navigateToBaseTabBar() {
        let baseTabBarController = BaseTabBarController()
        baseTabBarController.modalPresentationStyle = .fullScreen
        present(baseTabBarController, animated: true, completion: nil)
    }
}
