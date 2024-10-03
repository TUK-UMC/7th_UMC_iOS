//
//  ViewController.swift
//  week01_mission
//
//  Created by nelime on 9/28/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
    }
}








#if DEBUG
    import SwiftUI
    
    struct VCPreView: PreviewProvider {
        static var previews: some View {
            LoginViewController().toPreview()
        }
    }
#endif
