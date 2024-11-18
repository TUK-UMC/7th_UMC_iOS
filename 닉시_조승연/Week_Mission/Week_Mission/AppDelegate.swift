//
//  AppDelegate.swift
//  Week_Mission
//
//  Created by 조승연 on 10/31/24.
//

import UIKit
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Kakao SDK 초기화
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String {
            KakaoSDK.initSDK(appKey: apiKey)
            print("Kakao SDK initialized with API_KEY: \(apiKey)")
        } else {
            fatalError("API_KEY is missing in Info.plist")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
