//
//  ViewController.swift
//  Week01_study
//
//  Created by 조승연 on 9/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    var data: CountUpDownModel = CountUpDownModel(count: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView
    }
    
    private lazy var counterView: CountUpDownView = {
        let view = CountUpDownView()
        view.countLabel.text = String(data.count)
        view.countDownButton.addTarget(self, action: #selector(decreaaseCount), for: .touchUpInside)
        view.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        return view
    }()
    
    @objc func increaseCount() {
        self.data.increaseCount()
        self.updateCount()
    }
    
    @objc func decreaaseCount() {
        self.data.decreaseCount()
        self.updateCount()
    }
    
    private func updateCount() {
        self.counterView.countLabel.text = String(data.count)
    }
}


