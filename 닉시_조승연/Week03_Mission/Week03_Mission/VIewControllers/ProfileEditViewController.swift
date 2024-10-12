//
//  ProfileEditViewController.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    let profileView = ProfileView()
    var profileImage: UIImage?  // 프로필 이미지를 전달받기 위한 변수 추가
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(profileView)
        
        profileView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        // 저장된 이메일과 비밀번호 불러오기
        if let savedEmail = UserDefaults.standard.string(forKey: "userEmail"),
           let savedPassword = UserDefaults.standard.string(forKey: "userPassword") {
            profileView.emailTextField.text = savedEmail
            profileView.passwordTextField.text = savedPassword
        } else {
            print("No data found in UserDefaults.")
        }

        if let profileImage = self.profileImage {
            profileView.profileImageView.image = profileImage // 전달받은 이미지 설정
        }
        
        setupNavigationBar()
        setupActions()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "프로필 관리"

        let backButtonImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupActions() {
        profileView.emailChangeButton.addTarget(self, action: #selector(enableEmailEditing), for: .touchUpInside)
        profileView.passwordChangeButton.addTarget(self, action: #selector(enablePasswordEditing), for: .touchUpInside)
    }

    @objc private func enableEmailEditing() {
        if profileView.emailTextField.isUserInteractionEnabled {
            profileView.emailTextField.isUserInteractionEnabled = false
            profileView.emailChangeButton.setTitle("변경", for: .normal)

            // 이메일 값 저장
            let newEmail = profileView.emailTextField.text
            UserDefaults.standard.set(newEmail, forKey: "userEmail")
        } else {
            profileView.emailTextField.isUserInteractionEnabled = true
            profileView.emailTextField.text = ""
            profileView.emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
            profileView.emailTextField.becomeFirstResponder()
            profileView.emailChangeButton.setTitle("저장", for: .normal)
        }
    }
    
    @objc private func enablePasswordEditing() {
        if profileView.passwordTextField.isUserInteractionEnabled {
            profileView.passwordTextField.isUserInteractionEnabled = false
            profileView.passwordChangeButton.setTitle("변경", for: .normal)

            // 비밀번호 값 저장
            let newPassword = profileView.passwordTextField.text
            UserDefaults.standard.set(newPassword, forKey: "userPassword")
        } else {
            profileView.passwordTextField.isUserInteractionEnabled = true
            profileView.passwordTextField.text = ""
            profileView.passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
            profileView.passwordTextField.becomeFirstResponder()
            profileView.passwordChangeButton.setTitle("저장", for: .normal)
        }
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
