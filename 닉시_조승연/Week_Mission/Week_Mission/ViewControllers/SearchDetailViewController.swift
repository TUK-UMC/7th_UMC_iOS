import UIKit

class SearchDetailViewController: UIViewController {
    
    private let searchDetailView = SearchDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.addSubview(searchDetailView)
        searchDetailView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44) 
        }
    }
    
    private func setupActions() {
        searchDetailView.backButton.addTarget(self, action: #selector(backToSearchView), for: .touchUpInside)
        searchDetailView.cancelButton.addTarget(self, action: #selector(cancelToMain), for: .touchUpInside)
    }
    
    @objc private func backToSearchView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func cancelToMain() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
