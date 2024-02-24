//
//  AdminHomeViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class AdminHomeViewController: UIViewController {
    @IBOutlet weak var adminDetailsView: UIView!
    @IBOutlet weak var dashboardView: UIView!
    @IBOutlet weak var analyticsView: UIView!
    @IBOutlet weak var usersBtn: UIButton!
    @IBOutlet weak var usersView: UIView!
    @IBOutlet weak var marketBtn: UIButton!
    @IBOutlet weak var marketView: UIView!
    @IBOutlet weak var driversBtn: UIButton!
    @IBOutlet weak var driversView: UIView!
    @IBOutlet weak var ordersBtn: UIButton!
    @IBOutlet weak var ordersView: UIView!
    @IBOutlet weak var customerSupportBtn: UIButton!
    let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationItemBackground(hidden: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    // functions :-
    func setUpDesign(){
        title = "Home"
        adminDetailsView.layer.cornerRadius = 15
        analyticsView.layer.cornerRadius = 15
        dashboardView.layer.cornerRadius = 15
        ordersView.layer.cornerRadius = 15
        usersView.layer.cornerRadius = 15
        marketView.layer.cornerRadius = 15
        driversView.layer.cornerRadius = 15
        customerSupportBtn.setUpShadow(color: .systemYellow)
        
    }
    // btn tapped
    @IBAction func usersBtnTapped(_ sender: UIButton) {
        
    }
    @IBAction func ordersBtnTapped(_ sender: UIButton) {
        
    }
    @IBAction func driversBtnTapped(_ sender: UIButton) {
        navManager.push(screen: .drivers, nav: navigationController)
        
    }
    @IBAction func marketBtnTapped(_ sender: UIButton) {
        print("Push Market Screen")
        let marketVC = navManager.instantiate(screen: .marketVC)as! MarketViewController
        navigationController?.pushViewController(marketVC, animated: true)
    }
    @IBAction func CostumerServicesBtnTapped(_ sender: UIButton) {
        print("CostumerServicesTapped")
       navManager.push(screen: .CostumerServicesVC, nav: navigationController!)
    }
}
