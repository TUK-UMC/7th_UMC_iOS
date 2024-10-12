//
//  BaseViewController.swift
//  Week03_Mission
//
//  Created by 조승연 on 10/12/24.
//

import UIKit
import SnapKit

class BaseTabBarController: UITabBarController {

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: targetSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage!
    }

    private func createNavController(vc: UIViewController, title: String, imageName: String, selectedImageName: String, imageSize: CGSize, selectedImageSize: CGSize) -> UIViewController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title

        if let image = UIImage(named: imageName), let selectedImage = UIImage(named: selectedImageName) {
            navController.tabBarItem.image = resizeImage(image: image, targetSize: imageSize)
            navController.tabBarItem.selectedImage = resizeImage(image: selectedImage, targetSize: selectedImageSize)
        }
        
        return navController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = createNavController(vc: HomeViewController(), title: "HOME", imageName: "home", selectedImageName: "home.fill", imageSize: CGSize(width: 20, height: 21), selectedImageSize: CGSize(width: 20, height: 21))
        let styleVC = createNavController(vc: StyleViewController(), title: "STYLE", imageName: "style", selectedImageName: "style.fill", imageSize: CGSize(width: 28, height: 25), selectedImageSize: CGSize(width: 28, height: 25))
        let searchVC = createNavController(vc: SearchViewController(), title: "SHOP", imageName: "search", selectedImageName: "search.fill", imageSize: CGSize(width: 31, height: 31), selectedImageSize: CGSize(width: 31, height: 31))
        let savedVC = createNavController(vc: SavedViewController(), title: "SAVED", imageName: "saved", selectedImageName: "saved.fill", imageSize: CGSize(width: 18, height: 21), selectedImageSize: CGSize(width: 18, height: 21))
        let myVC = createNavController(vc: MyViewController(), title: "MY", imageName: "my", selectedImageName: "my.fill", imageSize: CGSize(width: 25, height: 25), selectedImageSize: CGSize(width: 25, height: 25))
        
        viewControllers = [homeVC, styleVC, searchVC, savedVC, myVC]

        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
}

