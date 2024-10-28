import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let emptyView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()

        showHomeView()
        
        homeView.segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
  
        NotificationCenter.default.addObserver(self, selector: #selector(showSearchView), name: NSNotification.Name("SearchBarTapped"), object: nil)
    }
    
    private func setupUI() {
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }

        homeView.addSubview(emptyView)
        emptyView.backgroundColor = .white
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(homeView.segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        emptyView.isHidden = true 
    }
    
    @objc private func segmentChanged() {
        if homeView.segmentedControl.selectedSegmentIndex == 0 {
            showHomeView()
        } else {
            showEmptyView()
        }
    }
    
    private func showHomeView() {
        emptyView.isHidden = true
    }
    
    private func showEmptyView() {
        emptyView.isHidden = false
    }
    
    @objc private func showSearchView() {
        let searchViewController = SimpleSearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SearchBarTapped"), object: nil)
    }
}
