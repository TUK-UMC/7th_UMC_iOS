//
//  SavedView.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit

class SavedView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var totalItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    private func setViews(){
        self.addSubview(title)
        self.addSubview(totalItemsLabel)
        self.addSubview(tableView)
    }
    
    private func setConstraints(){
        title.snp.makeConstraints{
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(45)
        }
  
        totalItemsLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(totalItemsLabel.snp.bottom).offset(14)
            $0.left.right.bottom.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
