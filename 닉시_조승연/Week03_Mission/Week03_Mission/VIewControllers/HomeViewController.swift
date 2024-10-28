import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let emptyView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        
        // 초기화면 설정 - '추천' 세그먼트 선택 시 homeView 표시
        showHomeView()
        
        // 세그먼트 변경 시 화면을 업데이트
        homeView.segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    private func setupUI() {
        view.addSubview(homeView)
        
        // HomeView 배치
        homeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // emptyView를 homeView 위에 추가하여 해당 부분만 가림
        homeView.addSubview(emptyView)
        emptyView.backgroundColor = .white
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(homeView.segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        emptyView.isHidden = true // 초기에는 hidden 상태
    }
    
    @objc private func segmentChanged() {
        if homeView.segmentedControl.selectedSegmentIndex == 0 {
            // '추천' 세그먼트 선택 시 homeView 표시
            showHomeView()
        } else {
            // 나머지 세그먼트 선택 시 빈 화면 표시
            showEmptyView()
        }
    }
    
    private func showHomeView() {
        emptyView.isHidden = true
    }
    
    private func showEmptyView() {
        emptyView.isHidden = false
    }
}
