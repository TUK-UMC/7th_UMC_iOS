import UIKit

class SavedViewController: UIViewController, UITableViewDelegate {
    
    private let data = DummySavedModelProvider.savedData
    private lazy var savedView = SavedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = savedView
        savedView.tableView.dataSource = self
        savedView.tableView.delegate = self
    }
}

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
