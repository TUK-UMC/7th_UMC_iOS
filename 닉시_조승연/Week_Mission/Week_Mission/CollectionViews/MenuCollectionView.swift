import UIKit

class MenuCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let model = HomeModel()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.register(HomeCellView.self, forCellWithReuseIdentifier: "MenuCell")
        self.showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! HomeCellView
        let imageName = model.menuItems[indexPath.item]
        let title = model.menuTitles[indexPath.item]
        cell.configure(with: UIImage(named: imageName) ?? UIImage(), title: title)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 40) / 5, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if model.menuTitles[indexPath.item] == "색다른 추천" {
            let detailModel = DetailModel()
            let detailViewController = DetailViewController(model: detailModel)
            let parentViewController = self.parentViewController()
            parentViewController?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension UIView {
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            parentResponder = responder.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
