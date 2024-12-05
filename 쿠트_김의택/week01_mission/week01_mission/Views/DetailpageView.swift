//
//  DetailpageView.swift
//  week01_mission
//
//  Created by nelime on 11/9/24.
//

import UIKit

class DetailpageView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matin kim")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        return imageView
    }()
    
    
    let colorPickerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumLineSpacing = 10
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(DetailColorViewCell.self, forCellWithReuseIdentifier: DetailColorViewCell.identifier)
    }
    
    let text1 = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    let text2 = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    let text3 = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
    }
    
    let text4 = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .lightGray
    }
    
    let saveButton = UIButton().then {
        $0.setImage(.savebutton, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    let purchaseButton = UIButton().then {
        $0.setImage(.purchasebutton, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    let sellButton = UIButton().then {
        $0.setImage(.sellbutton, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    
    private func addComponents() {
        [
            productImage,
            colorPickerCollectionView,
            text1,
            text2,
            text3,
            text4,
            saveButton,
            purchaseButton,
            sellButton
        ].forEach{addSubview($0)}
        
        productImage.snp.makeConstraints{
            $0.top.equalTo(safeAreaInsets).offset(48)
            $0.width.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        colorPickerCollectionView.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        text1.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(110)
            $0.left.equalToSuperview().offset(16)
        }
        
        text2.snp.makeConstraints{
            $0.top.equalTo(text1.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(16)
        }
        
        text3.snp.makeConstraints{
            $0.top.equalTo(text2.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(16)
        }
        
        text4.snp.makeConstraints{
            $0.top.equalTo(text3.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(16)
        }
        
        saveButton.snp.makeConstraints{
            $0.bottom.equalTo(safeAreaInsets)
            $0.centerY.equalTo(purchaseButton)
            $0.width.equalTo(29)
            $0.height.equalTo(38)
            $0.left.equalToSuperview().offset(10)
        }
        
        purchaseButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-38)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
            $0.right.equalTo(sellButton.snp.left).offset(-10)
        }
        
        sellButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-38)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
            $0.right.equalToSuperview().offset(-10)
        }
    }
}
