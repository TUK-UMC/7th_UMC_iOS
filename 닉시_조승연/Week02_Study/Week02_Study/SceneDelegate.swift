//
//  SceneDelegate.swift
//  Week02_Study
//
//  Created by 조승연 on 9/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = BaseViewController() // 원하는 뷰 컨트롤러 파일의 이름을 작성하면 됩니다.
        window?.makeKeyAndVisible()
    }

}

