import UIKit
import SnapKit

class JustDroppedCellView: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let priceLabel = UILabel()
    private let purchaseLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(purchaseLabel)
        
        imageView.contentMode = .scaleAspectFit
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        subtitleLabel.font = UIFont.systemFont(ofSize: 13)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        purchaseLabel.font = UIFont.systemFont(ofSize: 12)
        
        titleLabel.textAlignment = .left
        subtitleLabel.textAlignment = .left
        priceLabel.textAlignment = .left
        purchaseLabel.textAlignment = .left
        purchaseLabel.textColor = .gray
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(142)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(0) // 여백을 없앰
            make.leading.trailing.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10) 
            make.leading.trailing.equalToSuperview()
        }
        
        purchaseLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageUrl: String, title: String, subtitle: String, price: String) {
            imageView.kf.setImage(with: URL(string: imageUrl))
            titleLabel.text = title
            subtitleLabel.text = subtitle
            priceLabel.text = price
        }
}
