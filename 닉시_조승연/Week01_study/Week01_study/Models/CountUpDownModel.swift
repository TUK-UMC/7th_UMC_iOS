//
//  CountUpDownModel.swift
//  Week01_study
//
//  Created by 조승연 on 9/26/24.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}
