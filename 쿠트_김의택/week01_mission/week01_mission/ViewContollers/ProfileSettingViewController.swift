//
//  HomeViewController.swift
//  week01_mission
//
//  Created by nelime on 10/3/24.
//

import UIKit

class ProfileSettingViewController: UIViewController {
    private lazy var psView = ProfileSettingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = psView
        self.view.backgroundColor = .white
        
        self.title = "프로필 관리"
        let backImage = UIImage(systemName: "arrow.left")
        let backBarButtonItem = UIBarButtonItem(image: backImage,style: .plain, target: self, action: #selector (didTapBack)) // title 부분 수정
        backBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        psView.idButton.tag = 1
        psView.pwButton.tag = 2
        psView.idButton.addTarget(self, action: #selector(didTapChange), for: .touchUpInside)
        psView.pwButton.addTarget(self, action: #selector (didTapChange), for: .touchUpInside)
        
    }
    
    @objc func didTapChange(_ sender: UIButton) {
        switch sender.tag {
        case 1 :
            psView.idField.text = ""
            psView.idButton.setTitle("저장", for: .normal)
        case 2 :
            psView.pwField.text = ""
            psView.pwButton.setTitle("저장", for: .normal)
        default :
            print("error")
        }
        
    }
    

    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
