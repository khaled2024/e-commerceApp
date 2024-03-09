//
//  MarketHomeViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit

class MarketHomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var addMealsView: UIView!
    @IBOutlet weak var addAnnouncementView: UIView!
    @IBOutlet weak var ordersDashboardView: UIView!
    @IBOutlet weak var mealsDashboardView: UIView!
    @IBOutlet weak var driversDashboardView: UIView!
    @IBOutlet weak var usersDashboardView: UIView!
    @IBOutlet weak var dashboardView: UIView!
    @IBOutlet weak var analyticsView: UIView!
    @IBOutlet weak var abonnementLabel: UILabel!
    @IBOutlet weak var marketStatusView: UIView!
    @IBOutlet weak var marketStatus: UILabel!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var marketImage: UIImageView!
    @IBOutlet weak var MarketTopNavView: UIView!
    
    let navManager = NavigationManager()
    // MARK: -  Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    // MARK: - Functions
    func setDesign(){
        marketImage.makeCircle()
        marketStatusView.layer.cornerRadius = marketStatusView.frame.height/2
        MarketTopNavView.setCorners()
        analyticsView.setCorners()
        dashboardView.setCorners()
        addAnnouncementView.layer.cornerRadius = 10
        addMealsView.layer.cornerRadius = 10
        usersDashboardView.setCorners()
        driversDashboardView.setCorners()
        mealsDashboardView.setCorners()
        ordersDashboardView.setCorners()
    }
    // MARK: - Btn Tapped
    @IBAction func usersDashboardBtnTapped(_ sender: UIButton) {
        print("users of market")
    }
    @IBAction func addAnnouncementBtnTapped(_ sender: UIButton) {
        print("Add Announcement")
        navManager.push(screen: .marketAddAnnouncement, nav: navigationController)
    }
    @IBAction func addmealsBtnTapped(_ sender: UIButton) {
        print("Add Meal")
        navManager.push(screen: .marketAddMealDashboard, nav: navigationController)
    }
    @IBAction func driversDashboardBtnTapped(_ sender: UIButton) {
        print("drivers of market")
        navManager.push(screen: .marketDriversDashboard, nav: navigationController)
    }
    @IBAction func mealsDashboardBtnTapped(_ sender: UIButton) {
        print("meals of market")
        navManager.push(screen: .marketMealsDashboard, nav: navigationController)
    }
    @IBAction func ordersDashboardBtnTapped(_ sender: UIButton) {
        print("orders of market")
        navManager.push(screen: .marketOrdersDashboard, nav: navigationController)
    }
}
