//
//  LoadingViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit

class LoadingViewController: UIViewController {
    private var isOnboardingSeen: Bool!
    private let navManager = NavigationManager()
    private let storageManager = StorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOnboardingSeen = storageManager.isOnboardingSeen()
        print(isOnboardingSeen!)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showInitialScreen()
    }
    //functions
    private func showInitialScreen(){
        if isOnboardingSeen{
            // show main app
            navManager.show(screen: .mainApp, incontroller: self)
        }else{
            // show onboarding
            navManager.show(screen: .onboarding, incontroller: self)
        }
    }
    
    
    
}
