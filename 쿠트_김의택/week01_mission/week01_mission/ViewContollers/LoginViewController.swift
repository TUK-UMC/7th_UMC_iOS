//
//  ViewController.swift
//  week01_mission
//
//  Created by nelime on 9/28/24.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKCert

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginButton.addTarget(self, action: #selector (loginTapped), for: .touchUpInside)
        view.kakaoLogin.addTarget(self, action: #selector (loginWithKakaoTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
    }
    
    @objc
    private func loginTapped() {
        let viewController = BaseViewController()
        
        viewController.view.backgroundColor = .white
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
        
        guard let idText = loginView.idField.text, !idText.isEmpty else { return }
        guard let pwText = loginView.pwField.text, !pwText.isEmpty else { return }
        
        loginModel.saveUserID(idText)
        loginModel.saveUserPW(pwText)
    }
    
    private func setUserInfo() {
        UserApi.shared.me { [weak self] (user, error) in
            if let error = error {
                print(error)
            } else {
                guard let self = self else { return }
//                guard let userId = user?.id else {return}
//                guard let email = user?.kakaoAccount?.email else { return }
//                guard let profileImage = user?.kakaoAccount?.profile?.profileImageUrl else { return }
                guard let nickname = user?.kakaoAccount?.profile?.nickname else { return }
                
//                print(email)
//                print(profileImage)
//                print(nickname)
                
                let viewController = BaseViewController()
                
                viewController.view.backgroundColor = .white
                viewController.modalPresentationStyle = .fullScreen
                
                present(viewController, animated: true)
                
                loginModel.saveUserID(nickname)
            }
        }
    }
    
    @objc
    private func loginWithKakaoTapped() {
        print("kakao login tapped")
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
        else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        self.setUserInfo()

                        // 성공 시 동작 구현
                        _ = oauthToken
                    }
                }
        }
    }
}



#if DEBUG
import SwiftUI
import KakaoSDKUser

struct VCPreView: PreviewProvider {
    static var previews: some View {
        LoginViewController().toPreview()
    }
}
#endif
