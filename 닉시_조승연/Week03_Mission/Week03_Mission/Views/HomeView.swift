import UIKit
import SnapKit

class HomeView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 검색창, 알림 버튼, 세그먼트 컨트롤, 광고 이미지 뷰 설정
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
        imageView.image = UIImage(named: "advertisement") // 광고 이미지 설정
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 메뉴 컬렉션 뷰 설정
    private let menuItems = ["kreamdraw", "kreamchart", "kreammans", "kreamwomans", "kreamdiff", "kreamlower", "kream24AW", "kreambest", "kreambenefit", "kreamacne"]
    private let menuTitles = ["크림 드로우", "실시간 차트", "남성 추천", "여성 추천", "색다른 추천", "정가 아래", "윤세 24AW", "올해의 베스트", "10월 베네핏", "아크네 선물"]

    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(searchBar)
        addSubview(alertButton)
        addSubview(segmentedControl)
        addSubview(advertisementImageView)
        addSubview(menuCollectionView) // 메뉴 컬렉션 뷰 추가
        
        // 검색창 배치
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(alertButton.snp.leading).offset(-10)
            make.height.equalTo(40)
        }
        
        // 알림 버튼 배치
        alertButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(40)
        }
        
        // Segmented Control 배치
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        // 광고 이미지 배치
        advertisementImageView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(advertisementImageView.snp.width).multipliedBy(344.0 / 374.0)
        }
        
        // 메뉴 컬렉션 뷰 배치
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertisementImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(220) // 두 줄로 표시될 수 있는 높이 설정
        }
    }
    
    // MARK: - UICollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        let imageName = menuItems[indexPath.item]
        let title = menuTitles[indexPath.item]
        cell.configure(with: UIImage(named: imageName) ?? UIImage(), title: title)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 40) / 5, height: 100) // 5열로 나누고, 여백 고려
    }
}

// 메뉴 컬렉션 뷰 셀 클래스
class MenuCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2 // 두 줄로 표시
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        // 이미지 뷰 배치
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        // 타이틀 레이블 배치
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
}
