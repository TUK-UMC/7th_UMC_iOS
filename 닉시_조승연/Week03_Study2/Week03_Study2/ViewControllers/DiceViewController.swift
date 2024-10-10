//
//  ViewController.swift
//  Week03_Study2
//
//  Created by 조승연 on 10/10/24.
//

import UIKit

class DiceViewController: UIViewController {
    
    let data = dummyDiceModel.diceDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = diceView
        
    }
    
    private lazy var diceView: DiceView = {
        let view = DiceView()
        view.tableView.dataSource = self
        view.tableView.dataSource = self
        return view
    }()
}


extension DiceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiceCell.identifier, for: indexPath) as? DiceCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}


