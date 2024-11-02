//
//  SavedViewController.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit
import SnapKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModel.savedDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.tableView.dataSource = self
        return view
    }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            data.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
            
        cell.configure(model: data[indexPath.row])
            
        return cell
    }
    
}
