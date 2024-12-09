//
//  ViewController.swift
//  week09_study
//
//  Created by nelime on 11/30/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }
    
    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://i.namu.wiki/i/gBooaihLmxRO31p6RZ6NMYBBhZpi8AVdf1UZw8QXV2v0yGOdDW5Wxn4RbZKZ05tLD3FPKPzrSVQWtd1tsg2lfufar3zA507i0KHDOAtlp6i12ZGG0wO3q_DyJQIPGMQ41wlRFEG9vrUelOvtdJ2n6g.webp")
        return view
    }()


}
