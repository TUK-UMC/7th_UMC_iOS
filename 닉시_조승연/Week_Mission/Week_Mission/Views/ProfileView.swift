//
//  ProfileView.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    let profileImageView = UIImageView()
    let emailTextField = UITextField()
    let emailChangeButton = UIButton()
    let passwordTextField = UITextField()
    let passwordChangeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupProfileImageView()
        setupProfileInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileImageView() {
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        self.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(90)
        }
    }
    
    private func setupProfileInfo() {
        let profileInfoLabel = UILabel()
        profileInfoLabel.text = "프로필 정보"
        profileInfoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.addSubview(profileInfoLabel)
        
        profileInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        let emailLabel = UILabel()
        emailLabel.text = "유저 이메일"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        emailTextField.borderStyle = .roundedRect
        emailTextField.isUserInteractionEnabled = false  // 기본적으로 비활성화
        self.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(32)
        }

        emailChangeButton.setTitle("변경", for: .normal)
        emailChangeButton.setTitleColor(.black, for: .normal)
        emailChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        emailChangeButton.layer.borderWidth = 1
        emailChangeButton.layer.borderColor = UIColor.black.cgColor
        emailChangeButton.layer.cornerRadius = 8
        self.addSubview(emailChangeButton)
        
        emailChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        let passwordLabel = UILabel()
        passwordLabel.text = "유저 비밀번호"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.isUserInteractionEnabled = false  // 기본적으로 비활성화
        self.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(32)
        }

        passwordChangeButton.setTitle("변경", for: .normal)
        passwordChangeButton.setTitleColor(.black, for: .normal)
        passwordChangeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        passwordChangeButton.layer.borderWidth = 1
        passwordChangeButton.layer.borderColor = UIColor.black.cgColor
        passwordChangeButton.layer.cornerRadius = 8
        self.addSubview(passwordChangeButton)
        
        passwordChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
    }
}
