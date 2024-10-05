//
//  LoginView.swift
//  Week01_mission
//
//  Created by 조승연 on 9/29/24.
//

import UIKit

class LoginView: UIView {

    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "KREAM"
        label.font = UIFont(name: "Helvetica-BoldOblique", size: 36)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "KICKS RULE EVERYTHING AROUND ME"
        label.font = UIFont(name: "Helvetica-BoldOblique", size: 14)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = UIColor.lightGray
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(logoLabel)
        addSubview(subtitleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 4),
            subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 60),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
