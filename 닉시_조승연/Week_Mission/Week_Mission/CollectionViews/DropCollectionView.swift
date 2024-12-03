import UIKit
import Kingfisher
import SnapKit

class DropCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let model = HomeModel()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        
        self.register(JustDroppedCellView.self, forCellWithReuseIdentifier: "DropCell")
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.dropItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DropCell", for: indexPath) as! JustDroppedCellView
        let imageUrl = model.dropItems[indexPath.item]
        let title = model.dropTitles[indexPath.item]
        let subtitle = model.dropSubtitles[indexPath.item]
        let price = model.dropPrices[indexPath.item]
        cell.configure(with: imageUrl, title: title, subtitle: subtitle, price: price)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 142, height: 250)
    }
}

class JustDroppedViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let priceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(priceLabel)

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        imageView.snp.makeConstraints { $0.top.leading.trailing.equalToSuperview() }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview()
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
