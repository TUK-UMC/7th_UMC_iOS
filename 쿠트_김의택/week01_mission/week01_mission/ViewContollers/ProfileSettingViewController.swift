//
//  HomeViewController.swift
//  week01_mission
//
//  Created by nelime on 10/3/24.
//

import UIKit

class ProfileSettingViewController: UIViewController {
    private lazy var psView = ProfileSettingView()
    public var receivedProfileImg: UIImage?
    private let userDefaults = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = psView
        self.view.backgroundColor = .white
        
        self.title = "프로필 관리"
        let backImage = UIImage(systemName: "arrow.left")
        let backBarButtonItem = UIBarButtonItem(image: backImage,style: .plain, target: self, action: #selector (didTapBack)) // title 부분 수정
        backBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        psView.profileImage.image = receivedProfileImg
        
        psView.idButton.tag = 1
        psView.pwButton.tag = 2
        psView.idButton.addTarget(self, action: #selector(didTapChange), for: .touchUpInside)
        psView.pwButton.addTarget(self, action: #selector (didTapChange), for: .touchUpInside)
        
    }
    
    @objc func didTapChange(_ sender: UIButton) {
        switch sender.tag {
        case 1 :
            if psView.idButton.titleLabel?.text == "확인" {
                userDefaults.saveUserID(psView.idField.text!)
            } else {
                psView.idField.text = ""
                psView.idField.isUserInteractionEnabled = true
                psView.idButton.setTitle("확인", for: .normal)
            }
            
        case 2 :
            if psView.pwButton.titleLabel?.text == "확인" {
                userDefaults.saveUserPW(psView.pwField.text!)
            } else {
                psView.pwField.text = ""
                psView.pwField.isUserInteractionEnabled = true
                psView.pwButton.setTitle("확인", for: .normal)
            }
        default :
            print("error")
        }
        
    }
    
    
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
