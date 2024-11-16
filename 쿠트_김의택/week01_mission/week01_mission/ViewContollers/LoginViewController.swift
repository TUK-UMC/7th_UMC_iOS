//
//  ViewController.swift
//  week01_mission
//
//  Created by nelime on 9/28/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginButton.addTarget(self, action: #selector (loginTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
    }
    
    @objc
    private func loginTapped() {
        let viewController = BaseViewController()
        
        viewController.view.backgroundColor = .white
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
        
        guard let idText = loginView.idField.text, !idText.isEmpty else { return }
        guard let pwText = loginView.pwField.text, !pwText.isEmpty else { return }
        
        loginModel.saveUserID(idText)
        loginModel.saveUserPW(pwText)
    }
}



