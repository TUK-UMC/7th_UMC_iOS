import UIKit

class DetailView: UIView {
    let collectionView: UICollectionView
    private let mainImageView = UIImageView()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    private let priceValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()

    private let savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detailSaved")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.clipsToBounds = true

        let titleLabel = UILabel()
        titleLabel.text = "구매"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        
        let priceLabel = UILabel()
        priceLabel.text = "345,000"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .white

        let subLabel = UILabel()
        subLabel.text = "즉시 구매가"
        subLabel.font = UIFont.systemFont(ofSize: 12)
        subLabel.textColor = .white

        let rightStack = UIStackView(arrangedSubviews: [priceLabel, subLabel])
        rightStack.axis = .vertical
        rightStack.alignment = .center
        rightStack.spacing = 0

        let stack = UIStackView(arrangedSubviews: [titleLabel, rightStack])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 12

        button.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            stack.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])

        return button
    }()
    
    private let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.clipsToBounds = true

        let titleLabel = UILabel()
        titleLabel.text = "판매"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        
        let priceLabel = UILabel()
        priceLabel.text = "396,000"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .white

        let subLabel = UILabel()
        subLabel.text = "즉시 판매가"
        subLabel.font = UIFont.systemFont(ofSize: 12)
        subLabel.textColor = .white

        let rightStack = UIStackView(arrangedSubviews: [priceLabel, subLabel])
        rightStack.axis = .vertical
        rightStack.alignment = .center
        rightStack.spacing = 0

        let stack = UIStackView(arrangedSubviews: [titleLabel, rightStack])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 12

        button.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            stack.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        
        return button
    }()

    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 53, height: 53)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        
        setupMainImageView()
        setupCollectionView()
        setupTextLabels()
        setupBottomButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupMainImageView() {
        mainImageView.contentMode = .scaleAspectFit
        addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 93),
            mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor)
        ])
    }

    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 53)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20),
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: 419),
            collectionView.heightAnchor.constraint(equalToConstant: 53)
        ])
    }

    private func setupTextLabels() {
        addSubview(priceLabel)
        addSubview(priceValueLabel)
        addSubview(itemNameLabel)
        addSubview(itemDescriptionLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            priceValueLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            priceValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            itemNameLabel.topAnchor.constraint(equalTo: priceValueLabel.bottomAnchor, constant: 20),
            itemNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            itemDescriptionLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10),
            itemDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func setupBottomButtons() {
        addSubview(savedImageView)
        addSubview(redButton)
        addSubview(greenButton)
        
        savedImageView.translatesAutoresizingMaskIntoConstraints = false
        redButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            savedImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            savedImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            savedImageView.widthAnchor.constraint(equalToConstant: 30),
            savedImageView.heightAnchor.constraint(equalToConstant: 38),
            
            redButton.leadingAnchor.constraint(equalTo: savedImageView.trailingAnchor, constant: 20),
            redButton.centerYAnchor.constraint(equalTo: savedImageView.centerYAnchor),
            redButton.widthAnchor.constraint(equalToConstant: 147),
            redButton.heightAnchor.constraint(equalToConstant: 49),
            
            greenButton.leadingAnchor.constraint(equalTo: redButton.trailingAnchor, constant: 10),
            greenButton.centerYAnchor.constraint(equalTo: redButton.centerYAnchor),
            greenButton.widthAnchor.constraint(equalToConstant: 147),
            greenButton.heightAnchor.constraint(equalToConstant: 49)
        ])
    }

    func configure(with mainImage: UIImage, priceText: String, priceValue: String, itemName: String, itemDescription: String) {
        mainImageView.image = mainImage
        priceLabel.text = priceText
        priceValueLabel.text = priceValue
        itemNameLabel.text = itemName
        itemDescriptionLabel.text = itemDescription
    }
}
