//
//  SavedCellModel.swift
//  week01_mission
//
//  Created by nelime on 10/11/24.
//

struct SavedCellModel {
    let savedImage: String
    let savedName: String
    let savedExplain: String
    let savedWon: String
}

final class dummySavedModel {
    static let savedDatas: [SavedCellModel] = [
        SavedCellModel(savedImage: "thing1.jpg", savedName: "가방", savedExplain: "패셔너블한 가방", savedWon: "120,000원"),
        SavedCellModel(savedImage: "thing2.jpg", savedName: "반시", savedExplain: "달달한 반시", savedWon: "70,000원"),
        SavedCellModel(savedImage: "thing3.jpg", savedName: "귤", savedExplain: "잘익은 하우스 감귤", savedWon: "80,000원"),
        SavedCellModel(savedImage: "thing4.jpg", savedName: "주전자", savedExplain: "코코아 타먹기 딱 좋은 주전자", savedWon: "30,000원"),
        SavedCellModel(savedImage: "thing5.jpg", savedName: "수전", savedExplain: "내 화장실을 호텔처럼 만들어주는 수전", savedWon: "150,000원"),
        SavedCellModel(savedImage: "thing6.jpg", savedName: "탄산수", savedExplain: "홍초 타먹으면 에이드로 딱", savedWon: "17,000원"),
        SavedCellModel(savedImage: "thing7.jpg", savedName: "커피", savedExplain: "다른 커피와는 다른 맛", savedWon: "1,000원"),
        SavedCellModel(savedImage: "thing8.jpg", savedName: "참치캔", savedExplain: "고추 참치 먹고 싶다", savedWon: "12,000원"),
        SavedCellModel(savedImage: "thing9.jpg", savedName: "인덕션", savedExplain: "1인 자취생들을 위한 필수품", savedWon: "2,550,000원"),
        SavedCellModel(savedImage: "thing10.jpg", savedName: "쌀", savedExplain: "엄마가 한톨도 허투루 버리지 말라고 함", savedWon: "80,000원"),
    ]
}
