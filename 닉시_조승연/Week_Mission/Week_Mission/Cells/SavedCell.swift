import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"

    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private lazy var savedName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var savedPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var savedExplain: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()

    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SavedButton"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(savedImageView)
        contentView.addSubview(savedName)
        contentView.addSubview(savedPrice)
        contentView.addSubview(savedExplain)
        contentView.addSubview(bookmarkButton)
    }
    
    private func setupConstraints() {
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
            $0.width.height.equalTo(24)
        }
        
        savedPrice.snp.makeConstraints {
            $0.top.equalTo(bookmarkButton.snp.bottom).offset(14)
            $0.right.equalToSuperview().offset(-12)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }

    func configure(with model: SavedModel) {
        savedImageView.image = UIImage(named: model.savedImage)
        savedName.text = model.savedName
        savedPrice.text = model.savedPrice
        savedExplain.text = model.savedExplain
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        savedImageView.image = nil
        savedName.text = nil
        savedPrice.text = nil
        savedExplain.text = nil
    }
}
