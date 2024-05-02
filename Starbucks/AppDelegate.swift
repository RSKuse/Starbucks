//
//  AppDelegate.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.tintColor = StarbucksColors.primaryColor
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())

        window?.rootViewController = TabBarController()

        return true
    }

}


