//
//  UserDefaultsView.swift
//  week03_study
//
//  Created by nelime on 10/11/24.
//

import UIKit
import SnapKit

class UserDefaultsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setStackView()
        addViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "UserDefaults 실습 뷰"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
        
    }()
    
    public lazy var inputTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "아무 텍스트나 입력해주세요"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15)
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        
        textField.borderStyle = .none
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    public lazy var saveButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("userDefaults에 저장하기", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15)
        btn.backgroundColor = .gray
        
        return btn
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 26
        
        return stackView
    }()
    
    private lazy var subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20)
            label.text = "UserDefaults 값 출력 라벨"
            label.textColor = UIColor.black
            label.textAlignment = .center
            return label
        }()
        
        public lazy var showTextValue: UILabel = {
            let label = UILabel()

            label.font = UIFont.systemFont(ofSize: 20)
            label.text = "UserDefaults 값이 출력됩니다."
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            label.layer.borderWidth = 3
            label.layer.borderColor = UIColor.blue.cgColor
            label.layer.cornerRadius = 10
            return label
        }()
        
        private lazy var bottomStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = 21
            return stackView
        }()
    
    private func setStackView() {
            topStackView.addArrangedSubview(titleLabel)
            topStackView.addArrangedSubview(inputTextField)
            topStackView.addArrangedSubview(saveButton)
            
            bottomStackView.addArrangedSubview(subTitleLabel)
            bottomStackView.addArrangedSubview(showTextValue)
        }
        
        private func addViewConstraints() {
            self.addSubview(topStackView)
            self.addSubview(bottomStackView)
            
            topStackView.snp.makeConstraints {
                $0.top.equalToSuperview().offset(197)
                $0.left.equalToSuperview().offset(42)
                $0.right.equalToSuperview().offset(-42)
            }
            
            inputTextField.snp.makeConstraints {
                $0.height.equalTo(52)
                $0.width.equalTo(309)
            }
            
            saveButton.snp.makeConstraints {
                $0.height.equalTo(42)
                $0.width.equalTo(222)
            }
            
            bottomStackView.snp.makeConstraints {
                $0.top.equalTo(topStackView.snp.bottom).offset(114)
                $0.left.equalToSuperview().offset(56.5)
                $0.right.equalToSuperview().offset(-56.5)
            }
            
            subTitleLabel.snp.makeConstraints {
                $0.width.equalTo(280)
                $0.height.equalTo(24)
            }
            
            showTextValue.snp.makeConstraints {
                $0.width.equalTo(280)
                $0.height.equalTo(172)
            }
        }
}
