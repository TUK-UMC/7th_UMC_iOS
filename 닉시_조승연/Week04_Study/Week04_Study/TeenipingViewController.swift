//
//  TeenipingViewController.swift
//  Week04_Study
//
//  Created by 조승연 on 10/26/24.
//

import UIKit

import SnapKit
import Then

class TeenipingViewController: UIViewController {
    private let rootView = TeenipingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        rootView.teenipingCollectionView.dataSource = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.emptyLabel.isHidden = true
            rootView.teenipingCollectionView.isHidden = false
            rootView.teenipingCollectionView.reloadData()
        } else {
            rootView.emptyLabel.isHidden = false
            rootView.teenipingCollectionView.isHidden = true
        }
    }
}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeenipingModel.dummy().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeenipingCollectionViewCell.identifier,
            for: indexPath
        ) as? TeenipingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = TeenipingModel.dummy()
        if let image = list[indexPath.row].image {
            cell.imageView.image = image
        } else {
            print("이미지 로드 실패: \(list[indexPath.row].name)")
            cell.imageView.image = UIImage(systemName: "photo") // 기본 이미지로 대체
        }
        cell.titleLabel.text = list[indexPath.row].name
        return cell
    }
}
