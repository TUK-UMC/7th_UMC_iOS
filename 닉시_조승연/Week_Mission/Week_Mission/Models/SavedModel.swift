//
//  SavedModel.swift
//  Week_Mission
//
//  Created by 조승연 on 10/12/24.
//

import Foundation

struct SavedModel {
    let SavedImage: String
    let SavedName: String
    let SavedPrice: String
    let SavedExplain: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(SavedImage: "savedimage1", SavedName: "Acne Studio 머플러", SavedPrice: "399,000", SavedExplain: "색이 예쁘고 포근한 머플러"),
        SavedModel(SavedImage: "savedimage2", SavedName: "나이키 조던 신발", SavedPrice: "199,000", SavedExplain: "나이키 신발! 가격이 떨어진..."),
        SavedModel(SavedImage: "savedimage3", SavedName: "마똉킴 카드지갑", SavedPrice: "75,000",SavedExplain: "퀼팅 자수에 아코디언 카드지갑"),
        SavedModel(SavedImage: "savedimage4", SavedName: "비비안 웨스트우드 목걸이", SavedPrice: "370,000", SavedExplain: "유니크하고 색감이 예쁜 목걸이"),
        SavedModel(SavedImage: "savedimage5", SavedName: "스투시 반팔 티셔츠", SavedPrice: "140,000", SavedExplain: "휘뚜루 마뚜루 어디에나 잘 어울리는 티셔츠"),
        SavedModel(SavedImage: "savedimage6", SavedName: "나이키 덩크 신발", SavedPrice: "99,000", SavedExplain: "접하기 가볍고 어느 코디에 잘 어울리는 운동화"),
        SavedModel(SavedImage: "savedimage7", SavedName: "프라다 카드지갑", SavedPrice: "420,000", SavedExplain: "깔끔한 디자인의 카드지갑 명품을 곁들인"),
        SavedModel(SavedImage: "savedimage8", SavedName: "아디다스 삼바", SavedPrice: "145,000", SavedExplain: "모든 코디에 잘 어울리는 검정 운동화"),
        SavedModel(SavedImage: "savedimage9", SavedName: "스투시 맨투맨", SavedPrice: "189,000", SavedExplain: "누구든지 하나는 소장 할만한 맨투맨"),
        SavedModel(SavedImage: "savedimage10", SavedName: "다이아 반지", SavedPrice: "1,399,000", SavedExplain: "3캐럿의 다이아 반지")
    ]
}
