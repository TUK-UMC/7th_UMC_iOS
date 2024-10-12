//
//  SavedCells.swift
//  week01_mission
//
//  Created by nelime on 10/11/24.
//

import UIKit

class SavedCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "SavedCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedName.text = nil
        self.savedExplain.text = nil
        self.savedWon.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
        /* 주사위 이미지 값은 ViewController에서 작성하게 됩니다. */
        // imageView.image = UIImage(named: "여기에 더미 데이터 값이 들어갑니다.")
        
        return imageView
    }()
    
    private lazy var savedIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "bookmark.fill")
        icon.tintColor = UIColor.black
        return icon
    }()
    
    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.textColor = UIColor.black
        return name
    }()
    
    private lazy var savedExplain: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        name.textColor = UIColor.gray
        return name
    }()
    
    private lazy var savedWon: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        name.textColor = UIColor.black
        return name
    }()
    
    
    
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedName)
        self.addSubview(savedExplain)
        self.addSubview(savedWon)
        self.addSubview(savedIcon)
    }
    
    private func setConstraints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(72)
        }
        
        savedName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(savedImageView.snp.right).offset(16)
            
        }
        
        savedExplain.snp.makeConstraints {
            $0.top.equalTo(savedName.snp.bottom).offset(5)
            $0.left.equalTo(savedImageView.snp.right).offset(16)
            $0.right.equalToSuperview().offset(-142)
            
        }
        
        savedWon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(67)
            $0.right.equalToSuperview().offset(-16)
            
        }
        
        savedIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().offset(-17)
        }
    }
    
    
    
    
    public func configure(model: SavedCellModel) {
            self.savedImageView.image = UIImage(named: model.savedImage)
            self.savedName.text = model.savedName
            self.savedExplain.text = model.savedExplain
            self.savedWon.text = model.savedWon
        }
    
}

