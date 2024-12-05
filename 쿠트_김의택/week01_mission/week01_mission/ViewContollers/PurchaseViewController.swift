//
//  PurchaseViewController.swift
//  week01_mission
//
//  Created by nelime on 11/16/24.
//

import UIKit

class PurchaseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 클릭된 셀을 가져옴
        let cell = collectionView.cellForItem(at: indexPath) as! DetailSizeViewCell
            
            // 가져온 셀의 clickCount를 판단
            if cell.clickCount == 1 {
                // clickCount가 1이면 이미 선택되어 있는 셀이므로 다시 회색으로 바꿔줘야 함 -> 값을 0으로 변경
                cell.clickCount = 0
            }
            else {
                cell.clickCount += 1
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailSizeModel.dummy().count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailSizeViewCell.identifier,
            for: indexPath
        ) as? DetailSizeViewCell else {
            return UICollectionViewCell()
        }
        
        let list = DetailSizeModel.dummy()
        
        cell.title1.text = list[indexPath.row].size
        
        return cell
    }
    
    private lazy var purchaseView = PurchaseView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseView
        
        purchaseView.sizePickerCollectionView.dataSource = self
        purchaseView.sizePickerCollectionView.delegate = self
        
        purchaseView.closeButton.addTarget(self, action: #selector(CloseModal), for: .touchUpInside)

    }
    
    @objc func CloseModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


