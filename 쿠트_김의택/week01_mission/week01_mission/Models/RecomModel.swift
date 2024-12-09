import UIKit

struct RecomModel {
    let image: UIImage
    let name: String
}

extension RecomModel {
    static func dummy() -> [RecomModel] {
        return[
            RecomModel(image: .shoes, name: "색다른 추천"),
            RecomModel(image: .snickers, name: "크림 드로우"),
            RecomModel(image: .snickers2, name: "올해의 베스트"),
            RecomModel(image: .hat, name: "실시간 차트"),
            RecomModel(image: .bag, name: "10월 베네핏"),
            RecomModel(image: .nike, name: "남성 추천"),
            RecomModel(image: .radio, name: "정가 아래"),
            RecomModel(image: .bunny, name: "윤세 24AW"),
            RecomModel(image: .image, name: "아크네 선물"),
            RecomModel(image: .jacket, name: "여성 추천"),
        ]}
}
