import UIKit

class KeywordCell: UICollectionViewCell {
    static let identifier = "KeywordCell"
    
    private let keywordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(keywordLabel)
        contentView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            keywordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            keywordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            keywordLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            keywordLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with keyword: String) {
        keywordLabel.text = keyword
    }
}
