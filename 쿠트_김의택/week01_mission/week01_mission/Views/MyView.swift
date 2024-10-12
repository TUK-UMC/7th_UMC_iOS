
//
//  MyViewController.swift
//  week01_mission
//
//  Created by nelime on 10/4/24.
//

import UIKit

class MyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var settingsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var cameraIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_img")
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .red
        return imageView
    }()
    
    public lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "nelime"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    public lazy var profileFollower: UILabel = {
        let label = UILabel()
        label.text = "팔로워 2,199"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    public lazy var profileFollowing: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 41"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    // 프로필 설정 버튼 2개
    public func profileBtnSetting(for button: UIButton, named name: String){
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9)

        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor.lightGray.cgColor
        
//        button.widthAnchor.constraint(equalToConstant: 157).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    
    public lazy var profileSettingBtn: UIButton = {
        let button = UIButton()
        profileBtnSetting(for: button, named: "프로필 관리")
        
        return button
    }()
    
    public lazy var profileShareBtn: UIButton = {
        let button = UIButton()
        profileBtnSetting(for: button, named: "프로필 공유")

        return button
    }()
    
    private func addComponents() {
        self.addSubview(settingsIcon)
        self.addSubview(cameraIcon)
        self.addSubview(profileImage)
        self.addSubview(profileName)
        self.addSubview(profileFollower)
        self.addSubview(profileFollowing)
        
        self.addSubview(profileSettingBtn)
        self.addSubview(profileShareBtn)
        
        settingsIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.left.equalToSuperview().offset(32.5)
            make.width.height.equalTo(25)
        }
        
        cameraIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.right.equalToSuperview().offset(-32.5)
            make.width.height.equalTo(25)
        }
        
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(126)
            make.left.equalToSuperview().offset(32.5)
            make.height.width.equalTo(90)
        }
        
        profileName.snp.makeConstraints {
            $0.left.equalTo(profileImage.snp.right).offset(16)
            $0.bottom.equalTo(profileImage.snp.centerY).offset(-5)
        }
        profileFollower.snp.makeConstraints {
            $0.left.equalTo(profileImage.snp.right).offset(16)
            $0.top.equalTo(profileImage.snp.centerY).offset(5)
        }
        profileFollowing.snp.makeConstraints {
            $0.left.equalTo(profileFollower.snp.right).offset(5)
            $0.top.equalTo(profileImage.snp.centerY).offset(5)
        }
        
        profileSettingBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(242)
            make.left.equalToSuperview().offset(32.5)
            make.right.equalTo(super.snp.centerX).offset(-7)
            make.height.equalTo(26)
            
        }
        
        profileShareBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(242)
            make.right.equalToSuperview().offset(-32.5)
            make.left.equalTo(super.snp.centerX).offset(7)
            make.height.equalTo(26)
            
        }
    }
    


}
