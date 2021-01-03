//
//  AppDelegate.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit
import YandexMobileMetrica

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: "710ec4a5-8503-4371-a935-2825ec321888")
        YMMYandexMetrica.activate(with: configuration!)
        print(
            """
            ###########
            ###########
            ###########
            \(UIDevice.modelName)
            ###########
            ###########
            ###########
            """)
//        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
    }
}

