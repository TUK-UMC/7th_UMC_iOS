//
//  NavigationViewController.swift
//  week02_study
//
//  Created by nelime on 10/3/24.
//

import UIKit

class NavigationViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello, NVC!"
        label.textColor = .green
        
        button.setTitle("Goodbye, NVC!", for: .normal)
        button.backgroundColor = .blue
        
        view.addSubview(label)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .systemBlue
        
        navigationController?.pushViewController(viewController, animated: true)
        
        
        
    }
    

}
