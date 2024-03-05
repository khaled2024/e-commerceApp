//
//  NavigationManager.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//


import UIKit
class NavigationManager{
    enum Screen {
        case onboarding
        case mainApp
    }
    enum PushScreenOnly {
        case marketVC
        case marketDetail
        case CostumerServicesVC
        case drivers
        case editMarket
        case marketOrders
        case chatRoom
        case driverDetail
        case settingVC
        case subscriptionsVC
        case blockMarketVC
    }
    enum PushScreenToParse {
        case marketVC
        case marketDetail
        case CostumerServicesVC
        case chatRoom
        case marketOrders
        case driverDetail
    }
    // MARK: - instantiate controler from storyboard and push it in view when we need to parse some data :-
    func instantiate(screen: PushScreenToParse)-> UIViewController{
        var viewController: UIViewController!
        switch screen {
        case .marketDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: MarketDetailsViewController.identifier)
        case .marketVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "MarketViewController")
        case .CostumerServicesVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "CostumerServicesViewController")
        case .chatRoom:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier)
        case .marketOrders:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "MarketOrdersViewController")
        case .driverDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: DriverDetailsViewController.identifier)
        }
        return viewController
    }
    // MARK: - Push controller with our parsing data :-
    func push(screen: PushScreenOnly,nav: UINavigationController!){
        var viewController: UIViewController!
        switch screen {
        case .marketDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: MarketDetailsViewController.identifier)
        case .marketVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "MarketViewController")
        case .CostumerServicesVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "CostumerServicesViewController")
        case .drivers:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: DriversViewController.identifier)
        case .editMarket:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "EditMarketViewController")
        case .marketOrders:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "MarketOrdersViewController")
        case .chatRoom:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier)
        case .settingVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: SettingViewController.identifier)
        case .subscriptionsVC:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: SubscriptionsViewController.identifier)
        case .blockMarketVC:
            break
        case .driverDetail:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: DriverDetailsViewController.identifier)
        }
        nav.pushViewController(viewController, animated: true)
    }
    
    func pushOnly(screen: PushScreenOnly,nav: UINavigationController!){
        var vc: UIViewController!
        switch screen {
        case .marketVC:
            vc = MarketViewController()
        case .marketDetail:
            vc = MarketDetailsViewController()
        case .CostumerServicesVC:
            vc = CostumerServicesViewController()
        case .drivers:
            vc = DriversViewController()
        case .editMarket:
            vc = EditMarketViewController()
        case .marketOrders:
            vc = MarketOrdersViewController()
        case .chatRoom:
            vc = ChatRoomViewController()
        case .settingVC:
            break
        case .subscriptionsVC:
            break
        case .blockMarketVC:
            break
        case .driverDetail:
            break
        }
        nav.pushViewController(vc, animated: true)
    }
    
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
