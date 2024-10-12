//
//  HomeViewController.swift
//  week01_mission
//
//  Created by nelime on 10/3/24.
//

import UIKit
import SnapKit


class MyViewController: UIViewController {
    
    private lazy var myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
        
        myView.profileSettingBtn.addTarget(self, action: #selector (buttonDidTap), for: .touchUpInside)
        
        
        
        

    }
    
    @objc
    private func buttonDidTap() {
        let viewController = ProfileSettingViewController()
        navigationController?.pushViewController(viewController, animated: true)
        viewController.receivedProfileImg = myView.profileImage.image
        
        
        
    }
    

}
