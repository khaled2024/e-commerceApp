//
//  Comments.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 19/03/2024.
//

import Foundation
// MARK: -  FOR present VC 2 Ways
/// First Way

//        let adminTabbar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: AdminTabBarController.identifier)as! AdminTabBarController
//        adminTabbar.modalPresentationStyle = .fullScreen
//        adminTabbar.modalTransitionStyle = .flipHorizontal
//        self.present(adminTabbar, animated: true)





/// Second Way
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let window = windowScene.windows.first {
//            // Now you have access to the window
//            let adminRootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminTabBarController")as! AdminTabBarController
//            adminRootVC.view.layoutIfNeeded()
//            adminRootVC.modalTransitionStyle = .flipHorizontal
//            window.rootViewController = adminRootVC
//            window.makeKeyAndVisible()
//        }





/// Third Way

//let adminTabbar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminTabBarController")as! AdminTabBarController
//// Create a UIWindow instance and set its root view controller
//adminTabbar.modalPresentationStyle = .fullScreen
//adminTabbar.modalTransitionStyle = .flipHorizontal
//self.present(adminTabbar, animated: true)
