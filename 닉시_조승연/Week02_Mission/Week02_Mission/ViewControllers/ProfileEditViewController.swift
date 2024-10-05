import UIKit
import SnapKit

class ProfileEditViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let emailTextField = UITextField()
    let emailChangeButton = UIButton()
    let passwordTextField = UITextField()
    let passwordChangeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupProfileImageView()
        setupProfileInfo()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "프로필 관리"

        let backButtonImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "hachiwarae")
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        view.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(90)
        }
    }
    
    private func setupProfileInfo() {

        let profileInfoLabel = UILabel()
        profileInfoLabel.text = "프로필 정보"
        profileInfoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(profileInfoLabel)
        
        profileInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        let emailLabel = UILabel()
        emailLabel.text = "유저 이메일"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        emailTextField.borderStyle = .roundedRect
        emailTextField.text = "example@naver.com"
        emailTextField.isUserInteractionEnabled = false  // 기본적으로 비활성화
        view.addSubview(emailTextField)
        
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
        emailChangeButton.addTarget(self, action: #selector(enableEmailEditing), for: .touchUpInside)
        view.addSubview(emailChangeButton)
        
        emailChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        let passwordLabel = UILabel()
        passwordLabel.text = "유저 비밀번호"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.text = "****************"
        passwordTextField.isUserInteractionEnabled = false  // 기본적으로 비활성화
        view.addSubview(passwordTextField)
        
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
        passwordChangeButton.addTarget(self, action: #selector(enablePasswordEditing), for: .touchUpInside)
        view.addSubview(passwordChangeButton)
        
        passwordChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
    }
    
    // 이메일 수정 활성화
    @objc private func enableEmailEditing() {
        if emailTextField.isUserInteractionEnabled {
            // 수정된 값을 처리하고 비활성화
            emailTextField.isUserInteractionEnabled = false
            emailChangeButton.setTitle("변경", for: .normal)
            // 여기서 이메일 저장 로직 추가
            print("새 이메일: \(emailTextField.text ?? "")")
        } else {
            // 이메일 텍스트 필드를 활성화하고 기존 텍스트를 지우며 placeholder 설정
            emailTextField.isUserInteractionEnabled = true
            emailTextField.text = ""  // 기존 텍스트 제거
            emailTextField.placeholder = "새로운 이메일을 입력해주세요!"  // Placeholder 설정
            emailTextField.becomeFirstResponder()
            emailChangeButton.setTitle("저장", for: .normal)
        }
    }
    
    // 비밀번호 수정 활성화
    @objc private func enablePasswordEditing() {
        if passwordTextField.isUserInteractionEnabled {
            // 수정된 값을 처리하고 비활성화
            passwordTextField.isUserInteractionEnabled = false
            passwordChangeButton.setTitle("변경", for: .normal)
            // 여기서 비밀번호 저장 로직 추가
            print("새 비밀번호: \(passwordTextField.text ?? "")")
        } else {
            // 비밀번호 텍스트 필드를 활성화하고 기존 텍스트를 지우며 placeholder 설정
            passwordTextField.isUserInteractionEnabled = true
            passwordTextField.text = ""  // 기존 텍스트 제거
            passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"  // Placeholder 설정
            passwordTextField.becomeFirstResponder()
            passwordChangeButton.setTitle("저장", for: .normal)
        }
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
