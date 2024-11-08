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
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(changeUnderLinePosition),
            for: .valueChanged
        )
    }
    
    
    
    //    @objc
    //    private func segmentedControlValueChanged(segment: UISegmentedControl) {
    //        if segment.selectedSegmentIndex == 0 {
    //            homeView.recomCollectionView.isHidden = false
    //            homeView.banner.isHidden = false
    //
    //        }
    //        else {
    //            homeView.recomCollectionView.isHidden = true
    //            homeView.banner.isHidden = true
    //
    //        }
    //    }
    
    @objc private func changeUnderLinePosition(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.recomCollectionView.isHidden = false
            homeView.banner.isHidden = false
            
        }
        else {
            homeView.recomCollectionView.isHidden = true
            homeView.banner.isHidden = true
            
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
        return RecomModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
