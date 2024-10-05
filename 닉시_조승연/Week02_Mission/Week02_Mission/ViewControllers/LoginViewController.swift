//
//  LoginViewController.swift
//  Week02_Mission
//
//  Created by 조승연 on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
        setupActions()
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

    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }

    @objc private func handleLogin() {
        let baseTabBarController = BaseTabBarController()
        baseTabBarController.modalPresentationStyle = .fullScreen
        present(baseTabBarController, animated: true, completion: nil)
    }
}
