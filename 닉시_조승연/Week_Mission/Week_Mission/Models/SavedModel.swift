//
//  SavedModel.swift
//  Week_Mission
//
//  Created by 조승연 on 10/12/24.
//

import Foundation

struct SavedModel {
    let savedImage: String
    let savedName: String
    let savedPrice: String
    let savedExplain: String
}

final class DummySavedModelProvider {
    static let savedData: [SavedModel] = [
        SavedModel(savedImage: "savedimage1", savedName: "Acne Studio 머플러", savedPrice: "399,000", savedExplain: "색이 예쁘고 포근한 머플러"),
        SavedModel(savedImage: "savedimage2", savedName: "나이키 조던 신발", savedPrice: "199,000", savedExplain: "나이키 신발! 가격이 떨어진..."),
        SavedModel(savedImage: "savedimage3", savedName: "마똉킴 카드지갑", savedPrice: "75,000",savedExplain: "퀼팅 자수에 아코디언 카드지갑"),
        SavedModel(savedImage: "savedimage4", savedName: "비비안 웨스트우드 목걸이", savedPrice: "370,000", savedExplain: "유니크하고 색감이 예쁜 목걸이"),
        SavedModel(savedImage: "savedimage5", savedName: "스투시 반팔 티셔츠", savedPrice: "140,000", savedExplain: "휘뚜루 마뚜루 어디에나 잘 어울리는 티셔츠"),
        SavedModel(savedImage: "savedimage6", savedName: "나이키 덩크 신발", savedPrice: "99,000", savedExplain: "접하기 가볍고 어느 코디에 잘 어울리는 운동화"),
        SavedModel(savedImage: "savedimage7", savedName: "프라다 카드지갑", savedPrice: "420,000", savedExplain: "깔끔한 디자인의 카드지갑 명품을 곁들인"),
        SavedModel(savedImage: "savedimage8", savedName: "아디다스 삼바", savedPrice: "145,000", savedExplain: "모든 코디에 잘 어울리는 검정 운동화"),
        SavedModel(savedImage: "savedimage9", savedName: "스투시 맨투맨", savedPrice: "189,000", savedExplain: "누구든지 하나는 소장 할만한 맨투맨"),
        SavedModel(savedImage: "savedimage10", savedName: "다이아 반지", savedPrice: "1,399,000", savedExplain: "3캐럿의 다이아 반지")
    ]
}
