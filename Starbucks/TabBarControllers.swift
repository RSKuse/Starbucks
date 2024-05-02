//
//  TabBarControllers.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit


class TabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTabBar()
        setupViewControllers()

    }
    
    func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.white
    }
    
    func setupViewControllers() {
        
        let homeTabBarItem = UITabBarItem(title: "",
                                          image: UIImage(named: "icLogo"),
                                          selectedImage: UIImage(named: "icLogo"))
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.tabBarItem = homeTabBarItem
        
      
        let cartTabBarItem = UITabBarItem(title: "Cart",
                                            image: UIImage(named: "icCart"),
                                            selectedImage: UIImage(named: "icCart"))
        let cartController = UINavigationController(rootViewController: CartViewController())
        cartController.tabBarItem = cartTabBarItem
        
        let profileBarItem = UITabBarItem(title: "Profile",
                                              image: UIImage(named: "icProfileTab"),
                                              selectedImage: UIImage(named: "icProfileTab"))
        let profileController = UINavigationController(rootViewController: ProfileViewController())
        profileController.tabBarItem = profileBarItem
    
        self.viewControllers = [homeController, cartController, profileController]
        
    }
}
