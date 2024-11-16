//
//  LoginView.swift
//  week01_mission
//
//  Created by nelime on 9/28/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 타이틀 이미지
    public lazy var titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "kream-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 타이틀 텍스트 속성 지정 컨테이너
        private lazy var titleContainer: AttributeContainer = {
            var container = AttributeContainer()
            
            container.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            container.foregroundColor = UIColor.black
            
            
            return container
        }()
    
    // 아이디 타이틀
    public lazy var idTitle: UILabel = {
        let label = UILabel()
        
        label.attributedText = NSAttributedString(AttributedString("이메일 주소", attributes: titleContainer))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 비번 타이틀
    public lazy var pwTitle: UILabel = {
        let label = UILabel()
        
        label.attributedText = NSAttributedString(AttributedString("비밀번호", attributes: titleContainer))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 아이디 입력창
    public lazy var idField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "예) kream@kream.co.kr"
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    
    // 비번 입력창
    public lazy var pwField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "비밀번호를 입력해주세요"
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var loginTitleContainer: AttributeContainer = {
        var container = AttributeContainer()
        
        container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    
    
    public lazy var kakaoLogin: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        
        configuration.image = UIImage(systemName: "message.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: loginTitleContainer)
        
        configuration.cornerStyle = .fixed
        configuration.background.cornerRadius = 8
        configuration.background.strokeColor = UIColor.gray
        configuration.background.strokeWidth = 0.5
        
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        return button
    }()
    
    public lazy var appleLogin: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "apple.logo")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: loginTitleContainer)
        
        configuration.cornerStyle = .fixed
        configuration.background.cornerRadius = 8
        configuration.background.strokeColor = UIColor.gray
        configuration.background.strokeWidth = 0.5
        
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        return button
    }()
    
    
    private func addComponents() {
        self.addSubview(titleImage)
        self.addSubview(idTitle)
        self.addSubview(idField)
        self.addSubview(pwTitle)
        self.addSubview(pwField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLogin)
        self.addSubview(appleLogin)
        

        // SnapKit을 사용한 제약 설정
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(126)
            make.centerX.equalToSuperview()
        }

        idTitle.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(87)
            make.left.equalToSuperview().offset(45)
        }

        idField.snp.makeConstraints { make in
            make.top.equalTo(idTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(303)
            make.height.equalTo(34)
        }

        pwTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(362)
            make.left.equalToSuperview().offset(45)
        }

        pwField.snp.makeConstraints { make in
            make.top.equalTo(pwTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(303)
            make.height.equalTo(34)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwField.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
            make.width.equalTo(303)
            make.height.equalTo(38)
        }

        kakaoLogin.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(87)
            make.centerX.equalToSuperview()
            make.width.equalTo(298)
            make.height.equalTo(40)
        }

        appleLogin.snp.makeConstraints { make in
            make.top.equalTo(kakaoLogin.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
            make.width.equalTo(298)
            make.height.equalTo(40)
        }


        
//        NSLayoutConstraint.activate([
//            titleImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
//            titleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            
//            idTitle.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 87),
//            idTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
//            
//            idField.topAnchor.constraint(equalTo: idTitle.bottomAnchor, constant: 10),
//            idField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            idField.widthAnchor.constraint(equalToConstant: 303),
//            idField.heightAnchor.constraint(equalToConstant: 34),
//            
//            pwTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 362),
//            pwTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
//            
//            pwField.topAnchor.constraint(equalTo: pwTitle.bottomAnchor, constant: 10),
//            pwField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            pwField.widthAnchor.constraint(equalToConstant: 303),
//            pwField.heightAnchor.constraint(equalToConstant: 34),
//            
//            loginButton.topAnchor.constraint(equalTo: pwField.bottomAnchor, constant: 17),
//            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            loginButton.widthAnchor.constraint(equalToConstant: 303),
//            loginButton.heightAnchor.constraint(equalToConstant: 38),
//            
//            kakaoLogin.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
//            kakaoLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            kakaoLogin.widthAnchor.constraint(equalToConstant: 298),
//            kakaoLogin.heightAnchor.constraint(equalToConstant: 40),
//            
//            appleLogin.topAnchor.constraint(equalTo: kakaoLogin.bottomAnchor, constant: 17),
//            appleLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            appleLogin.widthAnchor.constraint(equalToConstant: 298),
//            appleLogin.heightAnchor.constraint(equalToConstant: 40),
//            
//            
//            
//            
//        ])
    }
    
    
    
    
    
    
    
    
}
