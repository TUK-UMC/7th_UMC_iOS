import UIKit
import SnapKit

class HomeView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        collectionView.register(HomeCellView.self, forCellWithReuseIdentifier: "MenuCell")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let dropItems = ["MLB", "jordan", "Human"]
    private let dropTitles = ["MLB", "Jordan", "Human Made"]
    private let dropSubtitles = ["청키 라이너 뉴욕 양키스", "Jordan 1 Retro High OG Yellow Ochre", "Varsity Jacket"]
    private let dropPrices = ["139,000원", "228,000원", "2,000,000원"]

    private lazy var dropCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(JustDroppedCellView.self, forCellWithReuseIdentifier: "DropCell")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let holidayItems = ["karina", "winter", "thousand_woo"]

    private lazy var holidayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HolidayCellView.self, forCellWithReuseIdentifier: "HolidayCell")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
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
            make.top.equalToSuperview().offset(20)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            return menuItems.count
        } else if collectionView == dropCollectionView {
            return dropItems.count
        } else {
            return holidayItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! HomeCellView
            let imageName = menuItems[indexPath.item]
            let title = menuTitles[indexPath.item]
            cell.configure(with: UIImage(named: imageName) ?? UIImage(), title: title)
            return cell
        } else if collectionView == dropCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DropCell", for: indexPath) as! JustDroppedCellView
            let imageName = dropItems[indexPath.item]
            let title = dropTitles[indexPath.item]
            let subtitle = dropSubtitles[indexPath.item]
            let price = dropPrices[indexPath.item]
            cell.configure(with: UIImage(named: imageName) ?? UIImage(), title: title, subtitle: subtitle, price: price)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HolidayCell", for: indexPath) as! HolidayCellView
            let imageName = holidayItems[indexPath.item]
            cell.configure(with: UIImage(named: imageName) ?? UIImage())
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView {
            return CGSize(width: (collectionView.bounds.width - 40) / 5, height: 100)
        } else if collectionView == dropCollectionView {
            return CGSize(width: 142, height: 250)
        } else {
            return CGSize(width: 124, height: 165)
        }
    }
}
