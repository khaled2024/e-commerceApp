//
//  DriverMoreViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 10/03/2024.
//

import UIKit

class DriverMoreViewController: UIViewController {

    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var settingView: UIView!
    let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.setCorners()
        settingView.setCorners()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    @IBAction func profileBtnTapped(_ sender: UIButton) {
        navManager.push(screen: .driverProfile, nav: navigationController)
    }
    @IBAction func settingBtnTapped(_ sender: UIButton) {
        navManager.push(screen: .driverSetting, nav: navigationController)
    }
    
}
