import UIKit

class PurchaseSheetView: UIView {
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "deletemodal.png"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "matinkimblack.png"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let purchaseLabel: UILabel = {
        let label = UILabel()
        label.text = "구매하기"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let subtitlePurchaseLabel: UILabel = {
        let label = UILabel()
        label.text = "(가격 단위 : 원)"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let fastDeliveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("345,000\n빠른배송(1-2일 소요)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let regularDeliveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.setTitle("407,000\n일반배송(5-7일 소요)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    var sizeButtons: [UIButton] = []
    var selectedSizeButton: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        setupCloseButton()
        setupLabels()
        setupImageTextStack()
        setupSizeButtons()
        setupBottomButtons()
    }
    
    private func setupCloseButton() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupLabels() {
        addSubview(purchaseLabel)
        purchaseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            purchaseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            purchaseLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(subtitlePurchaseLabel)
        subtitlePurchaseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitlePurchaseLabel.topAnchor.constraint(equalTo: purchaseLabel.bottomAnchor, constant: 5),
            subtitlePurchaseLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupImageTextStack() {
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 5
        textStackView.alignment = .leading
        
        let imageTextStackView = UIStackView(arrangedSubviews: [imageView, textStackView])
        imageTextStackView.axis = .horizontal
        imageTextStackView.spacing = 10
        imageTextStackView.alignment = .center
        
        addSubview(imageTextStackView)
        imageTextStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageTextStackView.topAnchor.constraint(equalTo: subtitlePurchaseLabel.bottomAnchor, constant: 20),
            imageTextStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageTextStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 91),
            imageView.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    private func setupSizeButtons() {
        let sizeStackView = UIStackView()
        sizeStackView.axis = .vertical
        sizeStackView.spacing = 10
        sizeStackView.alignment = .leading

        let sizes = ["S", "M", "L", "XL", "XXL"]
        
        for (index, size) in sizes.enumerated() {
            let button = createSizeButton(title: size, price: "360,000")
            sizeButtons.append(button)

            if index % 3 == 0 {
                let rowStackView = UIStackView()
                rowStackView.axis = .horizontal
                rowStackView.spacing = 10
                rowStackView.alignment = .leading
                sizeStackView.addArrangedSubview(rowStackView)
            }
            
            (sizeStackView.arrangedSubviews.last as? UIStackView)?.addArrangedSubview(button)
        }

        addSubview(sizeStackView)
        sizeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sizeStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            sizeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    private func setupBottomButtons() {
        let buttonStackView = UIStackView(arrangedSubviews: [fastDeliveryButton, regularDeliveryButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        buttonStackView.distribution = .equalSpacing

        addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        fastDeliveryButton.translatesAutoresizingMaskIntoConstraints = false
        regularDeliveryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fastDeliveryButton.widthAnchor.constraint(equalToConstant: 168),
            fastDeliveryButton.heightAnchor.constraint(equalToConstant: 58),
            regularDeliveryButton.widthAnchor.constraint(equalToConstant: 168),
            regularDeliveryButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    private func createSizeButton(title: String, price: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .center

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .black

        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.textColor = .red
        priceLabel.font = UIFont.boldSystemFont(ofSize: 12)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)

        button.addSubview(stackView)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 110),
            button.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        return button
    }
}
