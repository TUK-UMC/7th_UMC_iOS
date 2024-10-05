//
//  ViewController.swift
//  Week01_mission
//
//  Created by 조승연 on 9/29/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
    }

    private func setupLoginView() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
