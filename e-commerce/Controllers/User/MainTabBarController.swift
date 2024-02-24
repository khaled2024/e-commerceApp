//
//  MainTabBarController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    @IBOutlet weak var userMainTabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        
    }
    func setUpDesign(){
        userMainTabbar.setUpLayers()
        self.tabBar.tintColor = .systemOrange
        self.tabBar.unselectedItemTintColor = .darkGray
        self.delegate = self
    }
    
    
}
// UITabBarControllerDelegate
extension MainTabBarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 1{
            print("Selected \(self.selectedIndex)")
        }
    }
}

// comments

//        let homeVC = MainViewController()
//        let cartVC = CartViewController()
//        let favoriteVC = FavouriteViewController()
//        let orderVC = OrderViewController()
//
//        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
//        cartVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
//        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
//        orderVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
//
//        viewControllers = [homeVC,cartVC,favoriteVC,orderVC]
