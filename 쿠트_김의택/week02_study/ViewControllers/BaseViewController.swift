//
//  BaseViewController.swift
//  week02_study
//
//  Created by nelime on 10/3/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let modalVC = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "paperplane.fill"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "externaldrive.fill"), tag: 1)
        
        self.viewControllers = [modalVC, navigationVC]

    }
    

}
