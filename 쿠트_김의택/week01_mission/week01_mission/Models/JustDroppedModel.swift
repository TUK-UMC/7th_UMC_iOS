import UIKit

struct JustDroppedModel {
    let image: UIImage
    let name: String
    let explain: String
    let price: String
    let deal: String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return[
            JustDroppedModel(image: .justdroppedMlb, name: "MLB", explain: "정키라이너 뉴욕양키스", price: "139,000원", deal: "거래 12.8만"),
            JustDroppedModel(image: .justdroppedJordan, name: "Jordan", explain: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", deal: "거래 15.6만"),
            JustDroppedModel(image: .justdroppedHuman, name: "Human Made", explain: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원", deal: "거래 17.8만"),
            
        ]}
}
