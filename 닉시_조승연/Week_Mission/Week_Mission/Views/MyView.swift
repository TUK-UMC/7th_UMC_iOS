import UIKit
import SnapKit

class MyView: UIView {
    
    var viewController: UIViewController?
    var profileImage: UIImage?

    private let usernameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        loadNicknameFromKeychain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.snp.makeConstraints { make in
            make.width.equalTo(328)
        }
        
        let topBarView = UIView()
        addSubview(topBarView)
        
        let gearIcon = UIImageView()
        gearIcon.image = UIImage(systemName: "gearshape")
        gearIcon.tintColor = .black
        topBarView.addSubview(gearIcon)
        
        let cameraIcon = UIImageView()
        cameraIcon.image = UIImage(systemName: "camera")
        cameraIcon.tintColor = .black
        topBarView.addSubview(cameraIcon)
        
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "hachiwarae")
        self.profileImage = profileImageView.image
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        addSubview(profileImageView)
        
        usernameLabel.text = "Default Username"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        usernameLabel.textAlignment = .left
        addSubview(usernameLabel)
        
        let followerLabel = UILabel()
        followerLabel.text = "팔로워 326  팔로잉 20"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        followerLabel.textAlignment = .left
        addSubview(followerLabel)
        
        let manageProfileButton = UIButton()
        manageProfileButton.setTitle("프로필 관리", for: .normal)
        manageProfileButton.setTitleColor(.black, for: .normal)
        manageProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        manageProfileButton.layer.borderWidth = 1
        manageProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        manageProfileButton.layer.cornerRadius = 8
        manageProfileButton.addTarget(self, action: #selector(manageProfileButtonTapped), for: .touchUpInside)
        addSubview(manageProfileButton)
        
        let shareProfileButton = UIButton()
        shareProfileButton.setTitle("프로필 공유", for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        shareProfileButton.layer.borderWidth = 1
        shareProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        shareProfileButton.layer.cornerRadius = 8
        addSubview(shareProfileButton)
        
        topBarView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        gearIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        cameraIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(topBarView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(90)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
    
    private func loadNicknameFromKeychain() {
        if let nickname = KeychainHelper.shared.get(key: "kakaoNickname") {
            usernameLabel.text = nickname
        } else {
            usernameLabel.text = "닉네임 없음"
        }
    }
    
    @objc private func manageProfileButtonTapped() {
        let profileEditVC = ProfileEditViewController()
        profileEditVC.profileImage = self.profileImage 
        viewController?.navigationController?.pushViewController(profileEditVC, animated: true)
    }
}
