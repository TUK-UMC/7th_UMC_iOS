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
}
