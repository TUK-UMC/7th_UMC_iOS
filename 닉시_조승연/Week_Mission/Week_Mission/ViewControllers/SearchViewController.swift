import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let searchNavigationView = SearchNavigationView()
    private let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSearchView()
        view.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
        searchNavigationView.searchBar.addGestureRecognizer(tapGesture)
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchNavigationView
        
        NSLayoutConstraint.activate([
            searchNavigationView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            searchNavigationView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        searchNavigationView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    private func setupSearchView() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc private func searchBarTapped() {
        let searchDetailVC = SearchDetailViewController()
        searchDetailVC.modalPresentationStyle = .fullScreen
        present(searchDetailVC, animated: true, completion: nil)
    }
    
    @objc private func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
