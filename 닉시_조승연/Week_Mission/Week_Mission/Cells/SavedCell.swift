//
//  SavedTableViewCell.swift
//  Week_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedName.text = nil
        self.savedPrice.text = nil
        self.savedExplain.text = nil
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder :) has not been implemented")
    }

    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.textColor = UIColor.black
        return name
    }()

    private lazy var savedPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        price.textColor = UIColor.black
        return price
    }()
    
    private lazy var savedExplain: UILabel = {
        let explain = UILabel()
        explain.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        explain.textColor = UIColor.gray
        explain.numberOfLines = 0 // 여러 줄 설명을 가능하게 함
        return explain
    }()

    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SavedButton"), for: .normal)
        return button
    }()
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedName)
        self.addSubview(savedPrice)
        self.addSubview(savedExplain)
        self.addSubview(bookmarkButton)
    }
    
    private func setConstraints() {
        savedImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
            $0.width.height.equalTo(75)
        }
        
        savedName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.left.equalTo(savedImageView.snp.right).offset(12)
            $0.right.equalTo(bookmarkButton.snp.left).offset(-12)
        }
        
        savedExplain.snp.makeConstraints {
            $0.top.equalTo(savedName.snp.bottom).offset(8)
            $0.left.equalTo(savedImageView.snp.right).offset(12)
            $0.right.equalTo(bookmarkButton.snp.left).offset(-12)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(savedName.snp.centerY)
            $0.right.equalToSuperview().offset(-12)
            $0.width.height.equalTo(24)  // 북마크 버튼 크기
        }
        
        savedPrice.snp.makeConstraints {
            $0.top.equalTo(bookmarkButton.snp.bottom).offset(14)
            $0.right.equalToSuperview().offset(-12)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }


    public func configure(model: SavedModel){
        self.savedImageView.image = UIImage(named: model.SavedImage)
        self.savedName.text = model.SavedName
        self.savedPrice.text = model.SavedPrice
        self.savedExplain.text = model.SavedExplain
    }
}
