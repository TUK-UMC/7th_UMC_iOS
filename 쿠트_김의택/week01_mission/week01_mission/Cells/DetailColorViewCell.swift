
import UIKit

class DetailColorViewCell: UICollectionViewCell {
    static let identifier = "DetailColorViewCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private func setupView() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
       
    }
    
}
