//
//  RainbowViewController.swift
//  Week05_Study
//
//  Created by 조승연 on 10/31/24.
//

import UIKit
import SnapKit

class RainbowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
        self.view.backgroundColor = .white
    }
}
