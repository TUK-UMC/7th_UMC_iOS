//
//  ModalViewController.swift
//  week02_study
//
//  Created by nelime on 10/3/24.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello, MVC!"
        label.textColor = .black
        
        button.setTitle("Goodbye, MVC!", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .brown
        viewController.modalPresentationStyle = .pageSheet
        
        present(viewController, animated: true)
        
        
        
    }

}
