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
    }
    enum PushScreenToParse {
        case marketVC
        case marketDetail
        case CostumerServicesVC
        case chatRoom
        case marketOrders
    }
    // instantiate controler from storyboard and push it in view when we need to parse some data :-
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
        }
        return viewController
    }
    // Push controller with our parsing data :-
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
        }
        nav.pushViewController(viewController, animated: true)
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
