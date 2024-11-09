//
//  HomeViewController.swift
//  week01_mission
//
//  Created by nelime on 10/3/24.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupDelegate()
        setupAction()
        
        
    }
    
    private func setupDelegate(){
        homeView.recomCollectionView.dataSource = self
        homeView.justDroppedCollectionView.dataSource = self
        homeView.winterCollectionView.dataSource = self
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(changeUnderLinePosition),
            for: .valueChanged
        )
    }
    
    
    
    @objc private func changeUnderLinePosition(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.scrollView.isHidden = false
            
            
        }
        else {
            homeView.scrollView.isHidden = true
            
        }
        
        let segmentIndex = CGFloat(homeView.segmentedControl.selectedSegmentIndex)
        let segmentWidth = homeView.segmentedControl.frame.width / CGFloat(homeView.segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self = self else {
                return
            }
            
            homeView.underLineView.snp.updateConstraints {
                $0.leading.equalTo(self.homeView.segmentedControl.snp.leading).inset(leadingDistance)
            }
            
        })
    }
    
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.recomCollectionView {
            return RecomModel.dummy().count
        } else if collectionView == homeView.justDroppedCollectionView {
            return JustDroppedModel.dummy().count
        } else {
            return WinterModel.dummy().count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == homeView.recomCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecomCollectionViewCell.identifier,
                for: indexPath
            ) as? RecomCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = RecomModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            
            return cell
        } else if collectionView == homeView.justDroppedCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                for: indexPath
            ) as? JustDroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = JustDroppedModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.name.text = list[indexPath.row].name
            cell.explain.text = list[indexPath.row].explain
            cell.price.text = list[indexPath.row].price
            cell.deal.text = list[indexPath.row].deal
            
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WinterCollectionViewCell.identifier,
                for: indexPath
            ) as? WinterCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = WinterModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].id
            
            return cell
        }
        
        
        
    }
    
    
}

#if DEBUG
import SwiftUI

struct VCPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
#endif
