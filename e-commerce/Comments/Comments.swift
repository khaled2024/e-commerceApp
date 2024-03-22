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


// Store data in Keychain
//func saveUserDataToKeychain(username: String, password: String) {
//    KeychainWrapper.standard.set(username, forKey: "usernameKey")
//    KeychainWrapper.standard.set(password, forKey: "passwordKey")
//}
//
//// Retrieve data from Keychain
//func getUserDataFromKeychain() -> (String?, String?) {
//    let username = KeychainWrapper.standard.string(forKey: "usernameKey")
//    let password = KeychainWrapper.standard.string(forKey: "passwordKey")
//    return (username, password)
//}
//
//// Delete data from Keychain
//func deleteUserDataFromKeychain() {
//    KeychainWrapper.standard.removeObject(forKey: "usernameKey")
//    KeychainWrapper.standard.removeObject(forKey: "passwordKey")
//}



//
//func removeProduct(vc: ProductDetailViewController, myProduct: ProductData) {
//    if let index = self.userFavouriteProducts.firstIndex(where: {$0.id == myProduct.id}){
//        self.userFavouriteProducts.remove(at: index)
//        print("remove index \(index) of the product \(myProduct.id)")
//    }
//}
