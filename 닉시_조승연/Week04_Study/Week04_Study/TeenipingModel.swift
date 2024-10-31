//
//  TeenipingModel.swift
//  Week04_Study
//
//  Created by 조승연 on 10/26/24.
//

import Foundation
import UIKit

struct TeenipingModel {
    let image: UIImage?
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: UIImage(named: "hachuping"), name: "하츄핑"),
            TeenipingModel(image: UIImage(named: "lalaping"), name: "라라핑"),
            TeenipingModel(image: UIImage(named: "baroping"), name: "바로핑"),
            TeenipingModel(image: UIImage(named: "azaping"), name: "아자핑"),
            TeenipingModel(image: UIImage(named: "chachaping"), name: "차차핑"),
            TeenipingModel(image: UIImage(named: "haeping"), name: "해핑"),
            TeenipingModel(image: UIImage(named: "mugoping"), name: "무거핑"),
            TeenipingModel(image: UIImage(named: "siroping"), name: "시러핑")
        ]
    }
}
