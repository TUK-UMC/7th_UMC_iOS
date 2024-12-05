import UIKit

struct DetailColorModel {
    let image: UIImage
}

extension DetailColorModel {
    static func dummy() -> [DetailColorModel] {
        return[
            DetailColorModel(image: .color1),
            DetailColorModel(image: .color2),
            DetailColorModel(image: .color3),
            DetailColorModel(image: .color4),
            DetailColorModel(image: .color5),
            DetailColorModel(image: .color6),
            DetailColorModel(image: .color7),
        ]}
}
