import UIKit

class PurchaseSheetViewController: UIViewController {

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "deletemodal.png"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dismissPurchaseSheet), for: .touchUpInside)
        return button
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matinkimblack.png")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private let purchaseLabel: UILabel = {
        let label = UILabel()
        label.text = "구매하기"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    private let subtitlePurchaseLabel: UILabel = {
        let label = UILabel()
        label.text = "(가격 단위 : 원)"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    private var selectedSizeButton: UIButton?

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
        button.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)

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

    private let fastDeliveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1) // 빨간색
        button.layer.cornerRadius = 15
        button.setTitle("345,000\n빠른배송(1-2일 소요)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private let regularDeliveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 15
        button.setTitle("407,000\n일반배송(5-7일 소요)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(purchaseLabel)
        purchaseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            purchaseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            purchaseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(subtitlePurchaseLabel)
        subtitlePurchaseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitlePurchaseLabel.topAnchor.constraint(equalTo: purchaseLabel.bottomAnchor, constant: 5),
            subtitlePurchaseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 5
        textStackView.alignment = .leading
        
        let imageTextStackView = UIStackView(arrangedSubviews: [imageView, textStackView])
        imageTextStackView.axis = .horizontal
        imageTextStackView.spacing = 10
        imageTextStackView.alignment = .center
        
        view.addSubview(imageTextStackView)
        imageTextStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageTextStackView.topAnchor.constraint(equalTo: subtitlePurchaseLabel.bottomAnchor, constant: 20),
            imageTextStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageTextStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 91),
            imageView.heightAnchor.constraint(equalToConstant: 91)
        ])

        let sizeStackView = UIStackView()
        sizeStackView.axis = .vertical
        sizeStackView.spacing = 10
        sizeStackView.alignment = .leading

        let sizeButtons = ["S", "M", "L", "XL", "XXL"]
        var rowStackView: UIStackView? = nil

        for (index, size) in sizeButtons.enumerated() {
            let price = "360,000"
            let button = createSizeButton(title: size, price: price)

            if index % 3 == 0 {
                rowStackView = UIStackView()
                rowStackView?.axis = .horizontal
                rowStackView?.spacing = 10
                rowStackView?.alignment = .leading
                sizeStackView.addArrangedSubview(rowStackView!)
            }

            rowStackView?.addArrangedSubview(button)
        }

        view.addSubview(sizeStackView)
        sizeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sizeStackView.topAnchor.constraint(equalTo: imageTextStackView.bottomAnchor, constant: 20),
            sizeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])

        setupBottomButtons()
    }

    private func setupBottomButtons() {
        let buttonStackView = UIStackView(arrangedSubviews: [fastDeliveryButton, regularDeliveryButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        buttonStackView.distribution = .equalSpacing

        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
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

    @objc private func dismissPurchaseSheet() {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let sheet = sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = false
        }
    }

    @objc private func sizeButtonTapped(_ sender: UIButton) {
        if sender == selectedSizeButton {
            return
        }

        selectedSizeButton?.layer.borderColor = UIColor.lightGray.cgColor
        selectedSizeButton?.setTitleColor(.black, for: .normal)

        sender.layer.borderColor = UIColor.black.cgColor
        sender.setTitleColor(.black, for: .normal)

        selectedSizeButton = sender
    }
}
