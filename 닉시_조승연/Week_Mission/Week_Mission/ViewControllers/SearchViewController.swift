//
//  SearchViewController.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "검색 화면"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
