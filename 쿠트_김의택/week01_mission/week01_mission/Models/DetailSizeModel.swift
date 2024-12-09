import UIKit

struct DetailSizeModel {
    let size: String
}

extension DetailSizeModel {
    static func dummy() -> [DetailSizeModel] {
        return[
            DetailSizeModel(size: "S"),
            DetailSizeModel(size: "M"),
            DetailSizeModel(size: "L"),
            DetailSizeModel(size: "XL"),
            DetailSizeModel(size: "XXL"),
            
        ]}
}
