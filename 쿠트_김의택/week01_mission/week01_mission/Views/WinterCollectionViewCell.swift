
import UIKit

class WinterCollectionViewCell: UICollectionViewCell {
    static let identifier = "WinterCollectionViewCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    let imageView = UIImageView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 124, height: 165)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .white
        $0.text = "identification"
    }
    
    
    
    private func setupView() {
        addSubview(imageView)
        imageView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(11)
            $0.left.equalToSuperview().inset(10)
        }
    }
    
}
