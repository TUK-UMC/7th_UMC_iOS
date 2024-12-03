import UIKit
import Moya

class SearchDetailViewController: UIViewController {
    
    private let searchDetailView = SearchDetailView()
    private let tableView = UITableView()
    private var products: [Product] = []
    private let provider = MoyaProvider<SearchAPI>()

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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchDetailView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupActions() {
        searchDetailView.searchBar.delegate = self
        searchDetailView.backButton.addTarget(self, action: #selector(backToSearchView), for: .touchUpInside)
        searchDetailView.cancelButton.addTarget(self, action: #selector(cancelToMain), for: .touchUpInside)
    }
    
    @objc private func backToSearchView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func cancelToMain() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func fetchProducts(query: String) {
        provider.request(.search(query: query)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(SearchResponse.self, from: response.data)
                    self?.products = decodedResponse.products
                    self?.tableView.reloadData()
                } catch {
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error)")
            }
        }
    }
}

extension SearchDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row].title
        return cell
    }
}

extension SearchDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let query = textField.text, !query.isEmpty else {
            print("Empty search query")
            return false
        }
        
        fetchProducts(query: query)
        textField.resignFirstResponder()
        return true
    }
}
