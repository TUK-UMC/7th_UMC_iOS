//
//  SavedViewController.swift
//  Week02_Mission
//
//  Created by 조승연 on 9/30/24.
//

import UIKit
import SnapKit

class SavedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "저장 화면"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

