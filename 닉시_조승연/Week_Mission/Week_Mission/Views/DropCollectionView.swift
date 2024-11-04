import UIKit

class DropCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let model = HomeModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.register(JustDroppedCellView.self, forCellWithReuseIdentifier: "DropCell")
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.dropItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DropCell", for: indexPath) as! JustDroppedCellView
        let imageName = model.dropItems[indexPath.item]
        let title = model.dropTitles[indexPath.item]
        let subtitle = model.dropSubtitles[indexPath.item]
        let price = model.dropPrices[indexPath.item]
        cell.configure(with: UIImage(named: imageName) ?? UIImage(), title: title, subtitle: subtitle, price: price)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 142, height: 250)
    }
}
