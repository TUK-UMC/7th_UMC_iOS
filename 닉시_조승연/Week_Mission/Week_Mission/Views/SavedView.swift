import UIKit

class SavedView: UIView {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var totalItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(title)
        addSubview(totalItemsLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        title.snp.makeConstraints {
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
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(totalItemsLabel.snp.bottom).offset(14)
            $0.left.right.bottom.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
