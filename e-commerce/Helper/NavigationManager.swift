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
        case adminTabbar
        case userTabbar
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
        case marketDriversDashboard
        case marketMealsDashboard
        case marketAddMealDashboard
        case marketProfile
        case marketAddAnnouncement
        case marketAnnouncement
        // Driver Screens
        case driverOrderDetails
        case driverSetting
        case driverProfile
    }
    enum InstantiateScreens {
        // User Screens
        case loginPopUp
        // admin screens
        case adminMarketVC
        case adminMarketDetail
        case CostumerServicesVC
        case adminChatRoom
        case adminMarketOrders
        case adminDriverDetail
        // Market Screens
        case marketMealsDashboard
        case marketAddMealDashboard
        case marketProfile
        // Driver Screens
        case driverOrderDetails
        case driverSetting
        case driverProfile
    }
    // MARK: - instantiate controler from storyboard and push or present it in view when we need to parse some data :-
    func instantiate(screen: InstantiateScreens)-> UIViewController{
        var viewController: UIViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch screen {
        case .adminMarketDetail:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminMarketDetailsViewController.identifier)
        case .adminMarketVC:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketViewController.identifier)
        case .CostumerServicesVC:
            viewController = storyboard.instantiateViewController(withIdentifier: "CostumerServicesViewController")
        case .adminChatRoom:
            viewController = storyboard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier)
        case .adminMarketOrders:
            viewController = storyboard.instantiateViewController(withIdentifier: "AdminMarketOrdersViewController")
        case .adminDriverDetail:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminDriverDetailsViewController.identifier)
        case .marketMealsDashboard:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketMealsViewController.identifier)
        case .marketAddMealDashboard:
            viewController = storyboard.instantiateViewController(withIdentifier: AddMealViewController.identifier)
        case .marketProfile:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketProfileViewController.identifier)
        case .driverOrderDetails:
            viewController = storyboard.instantiateViewController(withIdentifier: OrderDetailsViewController.identifier)
        case .driverSetting:
            viewController = storyboard.instantiateViewController(withIdentifier: DriverSettingViewController.identifier)
        case .driverProfile:
            viewController = storyboard.instantiateViewController(withIdentifier: DriverProfileViewController.identifier)
        case .loginPopUp:
            viewController = storyboard.instantiateViewController(withIdentifier: POPUPVC.identifier)
        }
        return viewController
    }
    // MARK: - Push controller with our parsing data :-
    func push(screen: PushScreens,nav: UINavigationController!){
        var viewController: UIViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch screen {
            /// For Admin screens:-
        case .adminMarketDetail:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminMarketDetailsViewController.identifier)
        case .adminMarketVC:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketViewController.identifier)
        case .CostumerServicesVC:
            viewController = storyboard.instantiateViewController(withIdentifier: "CostumerServicesViewController")
        case .adminDrivers:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminDriversViewController.identifier)
        case .adminEditMarket:
            viewController = storyboard.instantiateViewController(withIdentifier: "AdminEditMarketViewController")
        case .adminMarketOrders:
            viewController = storyboard.instantiateViewController(withIdentifier: "AdminMarketOrdersViewController")
        case .adminChatRoom:
            viewController = storyboard.instantiateViewController(withIdentifier: ChatRoomViewController.identifier)
        case .adminSettingVC:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminSettingViewController.identifier)
        case .adminSubscriptionsVC:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminSubscriptionsViewController.identifier)
        case .adminBlockMarketVC:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminBlockMarketViewController.identifier)
        case .adminDriverDetail:
            viewController = storyboard.instantiateViewController(withIdentifier: AdminDriverDetailsViewController.identifier)
            /// For Market screens:-
        case .marketSetting:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketSettingViewController.identifier)
        case .marketOrdersDashboard:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketOrdersViewController.identifier)
        case .marketDriversDashboard:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketDriversViewController.identifier)
        case .marketMealsDashboard:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketMealsViewController.identifier)
        case .marketAddMealDashboard:
            viewController = storyboard.instantiateViewController(withIdentifier: AddMealViewController.identifier)
        case .marketProfile:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketProfileViewController.identifier)
        case .marketAddAnnouncement:
            viewController = storyboard.instantiateViewController(withIdentifier: AddAnnouncementViewController.identifier)
        case .marketAnnouncement:
            viewController = storyboard.instantiateViewController(withIdentifier: MarketAnnouncementViewController.identifier)
        case .driverOrderDetails:
            viewController = storyboard.instantiateViewController(withIdentifier: OrderDetailsViewController.identifier)
        case .driverSetting:
            viewController = storyboard.instantiateViewController(withIdentifier: DriverSettingViewController.identifier)
        case .driverProfile:
            viewController = storyboard.instantiateViewController(withIdentifier: DriverProfileViewController.identifier)
        }
        nav.pushViewController(viewController, animated: true)
    }
    // MARK: - make the screen is the root vc of app
    func show(screen: Screen, incontroller: UIViewController){
        var viewController: UIViewController!
        switch screen {
        case .onboarding:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnboardingViewController")
        case .mainApp:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController")
        case .adminTabbar:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: AdminTabBarController.identifier)
            viewController.modalTransitionStyle = .flipHorizontal
        case .userTabbar:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MainTabBarController.identifier)
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
