import UIKit
import Kingfisher

class HolidayCellView: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(124)
            make.height.equalTo(165)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageURL: String) {
        if let url = URL(string: imageURL) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: "placeholder") // 기본 이미지를 사용
        }
    }
}
