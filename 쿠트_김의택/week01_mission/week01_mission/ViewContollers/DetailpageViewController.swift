//
//  DetailpageViewController.swift
//  week01_mission
//
//  Created by nelime on 11/9/24.
//

import UIKit

class DetailpageViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailColorModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailColorViewCell.identifier,
            for: indexPath
        ) as? DetailColorViewCell else {
            return UICollectionViewCell()
        }
        
        let list = DetailColorModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        
        return cell
    }
    
    
    private lazy var detailpageView = DetailpageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailpageView
        
        detailpageView.colorPickerCollectionView.dataSource = self
        
        let backImage = UIImage(systemName: "arrow.left")
        let backBarButtonItem = UIBarButtonItem(image: backImage,style: .plain, target: self, action: #selector (didTapBack)) // title 부분 수정
        backBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        tabBarController?.tabBar.isHidden = true
        
        detailpageView.purchaseButton.addTarget(self, action: #selector (buttonTapped), for: .touchUpInside)

    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func buttonTapped() {
        let viewController = PurchaseViewController()
        
        viewController.view.backgroundColor = .white
        viewController.modalPresentationStyle = .automatic
//        viewController.modalTransitionStyle = .crossDissolve
        
        present(viewController, animated: true)
    }
   
}




#if DEBUG
import SwiftUI

struct VCPreView: PreviewProvider {
    static var previews: some View {
        DetailpageViewController().toPreview()
    }
}
#endif
