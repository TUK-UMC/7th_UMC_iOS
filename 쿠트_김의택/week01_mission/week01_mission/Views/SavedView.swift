//
//  SavedView.swift
//  week01_mission
//
//  Created by nelime on 10/11/24.
//

import UIKit

class SavedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var contentCount: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.black
        return label
    }()
        
        
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    
    
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(contentCount)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(100)
        }
        
        contentCount.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(contentCount.snp.bottom).offset(12)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-90)
        }
    }
}

