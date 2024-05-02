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
        
        let homeTabBarItem = UITabBarItem(title: "Home",
                                          image: StarbucksImages.homeImage,
                                          selectedImage: StarbucksImages.homeImage)
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.tabBarItem = homeTabBarItem
        
      
        let cartTabBarItem = UITabBarItem(title: "Cart",
                                            image: UIImage(named: "ic_cart"),
                                            selectedImage: UIImage(named: "ic_cart"))
        let cartController = UINavigationController(rootViewController: CartViewController())
        cartController.tabBarItem = cartTabBarItem
        
        let profileBarItem = UITabBarItem(title: "Profile",
                                              image: UIImage(named: "ic_profile"),
                                              selectedImage: UIImage(named: "ic_profile"))
        let profileController = UINavigationController(rootViewController: ProfileViewController())
        profileController.tabBarItem = profileBarItem
    
        self.viewControllers = [homeController, cartController, profileController]
        
    }
}
