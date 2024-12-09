//
//  HomeView.swift
//  week01_mission
//
//  Created by nelime on 11/6/24.
//

import UIKit
import Then
import SnapKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 13.5)
        return textField
    }()
    
    let alarmButton: UIButton = {
        let button = UIButton()
        
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "bell", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        $0.selectedSegmentIndex = 0
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    
    let banner = UIImageView().then {
        $0.image = UIImage(named: "banner")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    let justDropped = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let justDroppedExplain = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .lightGray
    }
    
    let winter = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let winterExplain = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .lightGray
    }
  
    let recomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 5
        $0.minimumLineSpacing = 15
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(RecomCollectionViewCell.self, forCellWithReuseIdentifier: RecomCollectionViewCell.identifier)
    }
    
    let justDroppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumLineSpacing = 20
        $0.scrollDirection = .horizontal
        $0.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
    }
    
    let winterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumLineSpacing = 20
        $0.scrollDirection = .horizontal
        $0.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(WinterCollectionViewCell.self, forCellWithReuseIdentifier: WinterCollectionViewCell.identifier)
    }
    
    
    
    
    private func setupView(){
        [
            textField,
            alarmButton,
            segmentedControl,
            underLineView,
            scrollView
        ].forEach{addSubview($0)}
        
        [
            banner,
            recomCollectionView,
            justDropped,
            justDroppedExplain,
            justDroppedCollectionView,
            winter,
            winterExplain,
            winterCollectionView
        ].forEach{scrollView.addSubview($0)}
        
        
        
        textField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-55)
            $0.height.equalTo(40)
        }
        
        alarmButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalTo(textField.snp.centerY)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(27)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.height.equalTo(2)
            
            $0.leading.equalTo(segmentedControl)
            
            $0.width.equalTo(segmentedControl.snp.width).dividedBy(segmentedControl.numberOfSegments)
            //이 부분이 중요한데 밑줄의 width는 위에서 선언된 segment control의 길이를 segment의 개수로 나눈 길이 이다
        }
        
        scrollView.snp.makeConstraints{
            $0.top.equalTo(underLineView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-90)
        }
        
        
        
        banner.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        
        recomCollectionView.snp.makeConstraints{
            $0.top.equalTo(banner.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(182)
            
        }
        
        justDropped.snp.makeConstraints{
            $0.top.equalTo(recomCollectionView.snp.bottom).offset(45)
            $0.left.equalToSuperview().inset(16)
        }
        
        justDroppedExplain.snp.makeConstraints{
            $0.top.equalTo(justDropped.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(16)
        }
        
        justDroppedCollectionView.snp.makeConstraints{
            $0.top.equalTo(recomCollectionView.snp.bottom).offset(103)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(237)
            
            
        }
        
        winter.snp.makeConstraints{
            $0.top.equalTo(justDroppedCollectionView.snp.bottom).offset(45)
            $0.left.equalToSuperview().inset(16)
        }
        
        winterExplain.snp.makeConstraints{
            $0.top.equalTo(winter.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(16)
        }
        
        winterCollectionView.snp.makeConstraints{
            $0.top.equalTo(winterExplain.snp.bottom).offset(14)
            $0.height.equalTo(165)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
