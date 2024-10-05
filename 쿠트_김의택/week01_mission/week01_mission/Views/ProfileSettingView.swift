//
//  ProfileSettingView.swift
//  week01_mission
//
//  Created by nelime on 10/4/24.
//

import UIKit

class ProfileSettingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "profile_img")
        
        return imageView
    }()
    
    public lazy var infoTitle: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "프로필 정보"
        
        return label
    }()
    
    
    
    
    
    
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        
        container.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        container.foregroundColor = UIColor.black
        
        
        return container
    }()
    
    // 아이디 타이틀
    public lazy var idTitle: UILabel = {
        let label = UILabel()
        
        label.attributedText = NSAttributedString(AttributedString("유저 이메일", attributes: titleContainer))
        label.textAlignment = .center
        
        return label
    }()
    
    // 비번 타이틀
    public lazy var pwTitle: UILabel = {
        let label = UILabel()
        
        label.attributedText = NSAttributedString(AttributedString("유저 비밀번호", attributes: titleContainer))
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var idButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    public lazy var pwButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    // 아이디 입력창
    public lazy var idField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "새로운 이메일을 입력해주세요"
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        field.leftViewMode = .always
        
        return field
    }()
    
    
    // 비번 입력창
    public lazy var pwField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "새로운 비밀번호를 입력해주세요"
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        field.leftViewMode = .always
        
        return field
    }()
    
    
    private func addComponents() {
        self.addSubview(profileImage)
        self.addSubview(infoTitle)
        self.addSubview(idTitle)
        self.addSubview(idField)
        self.addSubview(idButton)
        self.addSubview(pwTitle)
        self.addSubview(pwField)
        self.addSubview(pwButton)
        
        
        profileImage.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.top.equalToSuperview().offset(144)
            make.centerX.equalToSuperview()
        }
        
        infoTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(254)
            make.left.equalToSuperview().offset(27)
        }
        
        
        
        idTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(306)
            make.left.equalToSuperview().offset(27)
            
        }
        
        idField.snp.makeConstraints { make in
            make.top.equalTo(idTitle.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(27)
            make.right.equalTo(idButton.snp.left).offset(-9)
            make.height.equalTo(32)
        }
        
        idButton.snp.makeConstraints { make in
            make.top.equalTo(idTitle.snp.bottom).offset(4)
            make.right.equalToSuperview().offset(-17)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        
        
        
        pwTitle.snp.makeConstraints { make in
            make.top.equalTo(idField.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(27)
        }
        
        pwField.snp.makeConstraints { make in
            make.top.equalTo(pwTitle.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(27)
            make.right.equalTo(idButton.snp.left).offset(-9)
            make.height.equalTo(32)
        }
        
        pwButton.snp.makeConstraints { make in
            make.top.equalTo(pwTitle.snp.bottom).offset(4)
            make.right.equalToSuperview().offset(-17)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        
        
        
        
        
        
    }
    
}
