
import UIKit

class DetailSizeViewCell: UICollectionViewCell {
    static let identifier = "DetailSizeViewCell"
    
    // 초기 clickCount는 0이고! 셀이 클릭될 때마다 clickCount를 증가시켜줄 겁니다 (컬렉션뷰 메소드에서)
    // 0이면 회색, 1이면 빨강
    var clickCount: Int = 0 {
        didSet {
            
            if clickCount == 0 {
                sizeButton.layer.borderWidth = 1
                sizeButton.layer.borderColor = CGColor(gray: 0.2, alpha: 0.1)
                title1.font = .systemFont(ofSize: 14, weight: .medium)
            }
            else {
                sizeButton.layer.borderWidth = 2
                sizeButton.layer.borderColor = CGColor(gray: 0, alpha: 1)
                title1.font = .systemFont(ofSize: 14, weight: .bold)
            }
        }
    }
    
    // 중복 클릭을 허용하지 않기 때문에 isSelected를 체크해서 최근에 클릭된 버튼만 빨간색으로 변경
    override var isSelected: Bool {
        didSet {
            //            print("Asdf")
            if !isSelected {
                sizeButton.layer.borderWidth = 1
                sizeButton.layer.borderColor = CGColor(gray: 0.2, alpha: 0.1)
                title1.font = .systemFont(ofSize: 14, weight: .medium)
                clickCount = 0
            }
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    let sizeButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = CGColor(gray: 0.2, alpha: 0.1)
        $0.isUserInteractionEnabled = false
        
    }
    
    let title1 = UILabel().then{
        $0.text = "size"
        $0.font = .systemFont(ofSize: 14)
    }
    
    let title2 = UILabel().then{
        $0.text = "360,000"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .red
    }
    
    private func setupView() {
        addSubview(sizeButton)
        
        sizeButton.snp.makeConstraints{
            $0.width.equalTo(110)
            $0.height.equalTo(47)
            
        }
        
        [
            title1,
            title2
        ].forEach{sizeButton.addSubview($0)}
        
        title1.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(-5)
            $0.centerX.equalToSuperview()
        }
        
        title2.snp.makeConstraints{
            $0.centerY.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        
    }
    
}

