import UIKit

struct WinterModel {
    let image: UIImage
    let id: String
}

extension WinterModel {
    static func dummy() -> [WinterModel] {
        return[
            WinterModel(image: .winterKata, id: "@katarinabluu"),
            WinterModel(image: .winterInter, id: "@imwinter"),
            WinterModel(image: .winterThousand, id: "@thousand_wooo"),
            
        ]}
}
