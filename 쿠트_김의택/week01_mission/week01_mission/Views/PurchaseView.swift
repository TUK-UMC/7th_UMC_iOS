//
//  PurchaseView.swift
//  week01_mission
//
//  Created by nelime on 11/16/24.
//

import UIKit

class PurchaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let closeButton = UIButton().then {
        let image = UIImage(systemName: "xmark")
        $0.setImage(image, for: .normal)
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        $0.tintColor = .black
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    let productImage = UIImageView().then {
        $0.image = UIImage(named: "matin kim")
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .red
    }
    
    let title1 = UILabel().then {
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let title2 = UILabel().then {
        $0.text = "(가격단위: 원)"
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = .gray
    }
    
    let product1 = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .black
    }
    
    let product2 = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .gray
    }
    
    let quickSendButton = UIButton().then {
        $0.setImage(.quicksend, for: .normal)
    }
    
    let regularSendButton = UIButton().then {
        $0.setImage(.regularsend, for: .normal)
    }
    
    let sizePickerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 110, height: 47)
        $0.minimumInteritemSpacing = 0
        $0.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(DetailSizeViewCell.self, forCellWithReuseIdentifier: DetailSizeViewCell.identifier)
    }
    
    private func setupView() {
        [
            closeButton,
            title1,
            title2,
            product1,
            product2,
            productImage,
            quickSendButton,
            regularSendButton,
            sizePickerCollectionView
        ].forEach{addSubview($0)}
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaInsets).offset(20)
            $0.right.equalToSuperview().offset(-30)
        }
        
        title1.snp.makeConstraints {
            $0.top.equalTo(safeAreaInsets).offset(20)
            $0.centerX.equalToSuperview()
        }
        title2.snp.makeConstraints {
            $0.top.equalTo(title1.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        
        productImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(91)
            $0.height.equalTo(91)

        }
        product1.snp.makeConstraints {
            $0.centerY.equalTo(productImage.snp.centerY).offset(-10)
            $0.left.equalTo(productImage.snp.right).offset(10)
        }
        product2.snp.makeConstraints {
            $0.centerY.equalTo(productImage.snp.centerY).offset(10)
            $0.left.equalTo(productImage.snp.right).offset(10)
        }
        
        quickSendButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.right.equalTo(super.snp.centerX).offset(-5)
        }
        
        regularSendButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.left.equalTo(super.snp.centerX).offset(5)
        }
        
        sizePickerCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(40)
//            $0.left.right.equalToSuperview()
//            $0.width.equalTo(360)
            $0.height.equalTo(200)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
