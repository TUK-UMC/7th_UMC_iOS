//
//  MyViewController.swift
//  Week02_Mission
//
//  Created by 조승연 on 9/30/24.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // MyView 추가
        let myView = MyView(frame: self.view.frame)
            myView.viewController = self
            view.addSubview(myView)
            myView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}


