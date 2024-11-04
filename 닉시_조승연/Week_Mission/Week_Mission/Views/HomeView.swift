import UIKit
import SnapKit

class HomeView: UIView {

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let searchBar: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = true
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
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(alertButton.snp.leading).offset(-10)
            make.height.equalTo(40)
        }
        
        alertButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(40)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        advertisementImageView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(advertisementImageView.snp.width).multipliedBy(344.0 / 374.0)
        }

        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertisementImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(220)
        }
        
        justDroppedLabel.snp.makeConstraints { make in
            make.top.equalTo(menuCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        releaseLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(20)
        }
        
        dropCollectionView.snp.makeConstraints { make in
            make.top.equalTo(releaseLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(300)
        }
        
        holidayLabel.snp.makeConstraints { make in
            make.top.equalTo(dropCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        holidaySubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(holidayLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(20)
        }
        
        holidayCollectionView.snp.makeConstraints { make in
            make.top.equalTo(holidaySubtitleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(165)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    @objc private func searchBarTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("SearchBarTapped"), object: nil)
    }
}
