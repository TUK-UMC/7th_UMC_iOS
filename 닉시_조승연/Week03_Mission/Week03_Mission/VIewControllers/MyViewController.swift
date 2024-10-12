//
//  MyViewController.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let myView = MyView(frame: self.view.frame)
        myView.viewController = self
        view.addSubview(myView)
        
        myView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
