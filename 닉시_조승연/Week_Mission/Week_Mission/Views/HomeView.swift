import UIKit
import SnapKit
import Kingfisher

class HomeView: UIView {

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let searchBar: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let alertButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "homeAlert"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let segmentedControl: HomeUISegmentedControl = {
        let control = HomeUISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        control.selectedSegmentIndex = 0
        return control
    }()
    
    let advertisementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "advertisement")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let menuCollectionView = MenuCollectionView()
    private let dropCollectionView = DropCollectionView()
    private let holidayCollectionView = HolidayCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
        searchBar.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(searchBar)
        contentView.addSubview(alertButton)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(advertisementImageView)
        contentView.addSubview(menuCollectionView)
        
        let justDroppedLabel = UILabel()
        justDroppedLabel.text = "Just Dropped"
        justDroppedLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentView.addSubview(justDroppedLabel)
        
        let releaseLabel = UILabel()
        releaseLabel.text = "발매 상품"
        releaseLabel.font = UIFont.systemFont(ofSize: 13)
        releaseLabel.textColor = .gray
        contentView.addSubview(releaseLabel)
        
        contentView.addSubview(dropCollectionView)
        
        let holidayLabel = UILabel()
        holidayLabel.text = "본격 한파대비! 연말 필수템 모음"
        holidayLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentView.addSubview(holidayLabel)
        
        let holidaySubtitleLabel = UILabel()
        holidaySubtitleLabel.text = "#해피홀리룩챌린지"
        holidaySubtitleLabel.font = UIFont.systemFont(ofSize: 13)
        holidaySubtitleLabel.textColor = .gray
        contentView.addSubview(holidaySubtitleLabel)
        
        contentView.addSubview(holidayCollectionView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.bottom.equalTo(holidayCollectionView.snp.bottom).offset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(alertButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
        }
        
        alertButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(40)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        advertisementImageView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(advertisementImageView.snp.width).multipliedBy(344.0 / 374.0)
        }

        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(advertisementImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(220)
        }
        
        justDroppedLabel.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        releaseLabel.snp.makeConstraints {
            $0.top.equalTo(justDroppedLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(20)
        }
        
        dropCollectionView.snp.makeConstraints {
            $0.top.equalTo(releaseLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
        
        holidayLabel.snp.makeConstraints {
            $0.top.equalTo(dropCollectionView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        holidaySubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(holidayLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(20)
        }
        
        holidayCollectionView.snp.makeConstraints {
            $0.top.equalTo(holidaySubtitleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(165)
        }
    }
    
    @objc private func searchBarTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("SearchBarTapped"), object: nil)
    }
}
