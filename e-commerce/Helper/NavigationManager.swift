//
//  NavigationManager.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//


import UIKit
class NavigationManager{
    // MARK: - For Onboarding Screens
    enum Screen {
        case onboarding
        case mainApp
    }
    // MARK: - For Push Screen
    enum PushScreens {
        // Admin Screens
        case adminMarketVC
        case adminMarketDetail
        case CostumerServicesVC
        case adminDrivers
        case adminEditMarket
        case adminMarketOrders
        case adminChatRoom
        case adminDriverDetail
        case adminSettingVC
        case adminSubscriptionsVC
        case adminBlockMarketVC
        // Market Screens
        case marketSetting
        case marketOrdersDashboard
    }
    enum InstantiateScreens {
        // admin screens
        case adminMarketVC
        case adminMarketDetail
        case CostumerServicesVC
        case adminChatRoom
        case adminMarketOrders
        case adminDriverDetail
    }
    // MARK: - instantiate controler from storyboard and push or present it in view when we need to parse some data :-
    func instantiate(screen: InstantiateScreens)-> UIViewController{
        var viewController: UIViewController!
        switch screen {
        case .adminMarketDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminMarketDetailsViewController.identifier)
        case .adminMarketVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: MarketViewController.identifier)
        case .CostumerServicesVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "CostumerServicesViewController")
        case .adminChatRoom:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier)
        case .adminMarketOrders:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "AdminMarketOrdersViewController")
        case .adminDriverDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminDriverDetailsViewController.identifier)
        }
        return viewController
    }
    // MARK: - Push controller with our parsing data :-
    func push(screen: PushScreens,nav: UINavigationController!){
        var viewController: UIViewController!
        switch screen {
            /// For Admin screens:-
        case .adminMarketDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminMarketDetailsViewController.identifier)
        case .adminMarketVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: MarketViewController.identifier)
        case .CostumerServicesVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "CostumerServicesViewController")
        case .adminDrivers:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminDriversViewController.identifier)
        case .adminEditMarket:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "AdminEditMarketViewController")
        case .adminMarketOrders:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "AdminMarketOrdersViewController")
        case .adminChatRoom:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier)
        case .adminSettingVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminSettingViewController.identifier)
        case .adminSubscriptionsVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminSubscriptionsViewController.identifier)
        case .adminBlockMarketVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminBlockMarketViewController.identifier)
        case .adminDriverDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: AdminDriverDetailsViewController.identifier)
            /// For Market screens:-
        case .marketSetting:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: MarketSettingViewController.identifier)
        case .marketOrdersDashboard:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: MarketOrdersViewController.identifier)
        }
        nav.pushViewController(viewController, animated: true)
    }
    
//    func pushOnly(screen: PushScreenOnly,nav: UINavigationController!){
//        var vc: UIViewController!
//        switch screen {
//        case .marketVC:
//            vc = MarketViewController()
//        case .marketDetail:
//            vc = MarketDetailsViewController()
//        case .CostumerServicesVC:
//            vc = CostumerServicesViewController()
//        case .drivers:
//            vc = DriversViewController()
//        case .editMarket:
//            vc = EditMarketViewController()
//        case .marketOrders:
//            vc = AdminMarketOrdersViewController()
//        case .chatRoom:
//            vc = ChatRoomViewController()
//        case .settingVC:
//            break
//        case .subscriptionsVC:
//            break
//        case .blockMarketVC:
//            break
//        case .driverDetail:
//            break
//        case .marketSetting:
//            <#code#>
//        }
//        nav.pushViewController(vc, animated: true)
//    }
    
    func show(screen: Screen, incontroller: UIViewController){
        var viewController: UIViewController!
        switch screen {
        case .onboarding:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnboardingViewController")
        case .mainApp:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController")
        }
        if let sceneDelegate = incontroller.view.window?.windowScene?.delegate as? SceneDelegate,let window = sceneDelegate.window{
            window.rootViewController = viewController
            UIView.transition(with: window,
                              duration: 0,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
        
    }
    
}
