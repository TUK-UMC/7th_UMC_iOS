import UIKit
import SnapKit

class HolidayCellView: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(124)
            make.height.equalTo(165)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
}
