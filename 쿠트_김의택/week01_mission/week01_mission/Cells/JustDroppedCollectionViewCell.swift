
import UIKit
import Then

class JustDroppedCollectionViewCell: UICollectionViewCell {
    static let identifier = "JustDroppedCollectionViewCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    let imageView = UIImageView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 142, height: 142)
        $0.layer.cornerRadius = 12
        $0.backgroundColor = UIColor(red: 246, green: 237, blue: 236, alpha: 0)
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 0.5
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    
    let deal = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .gray
        $0.text = "거래 횟수"
    }
    
    let saveButton: UIButton = {
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "bookmark", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    
    let name = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
        $0.text = "상품 문구"
    }
    
    let explain = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.text = "상품 설명"
    }
    let price = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .black
        $0.text = "상품 가격"
    }
    let fixedPrice = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .lightGray
        $0.text = "즉시 구매가"
    }
    
    
    
    private func setupView() {
        [
            imageView,
            name,
            explain,
            price,
            fixedPrice,
            
        ].forEach{addSubview($0)}
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
     
        [
            deal,
            saveButton
        ].forEach{imageView.addSubview($0)}
        
        deal.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.right.equalToSuperview().offset(-8)
            
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalToSuperview().offset(-10)
            
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(4)
        }
        
        explain.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(3)
            $0.left.equalToSuperview().offset(4)
            $0.width.equalTo(142)
            
        }
        
        price.snp.makeConstraints {
            $0.top.equalTo(explain.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(4)
        }
        
        fixedPrice.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(2)
            $0.left.equalToSuperview().offset(4)
        }
        
        
        
    }
    
}
