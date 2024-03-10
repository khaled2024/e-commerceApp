//
//  DriverHomeViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 10/03/2024.
//

import UIKit

class DriverHomeViewController: UIViewController {
    
    @IBOutlet weak var currentOrdersView: UIView!
    @IBOutlet weak var completedOrdersView: UIView!
    @IBOutlet weak var dashboardView: UIView!
    @IBOutlet weak var analyticsView: UIView!
    @IBOutlet weak var abonnementLabel: UILabel!
    @IBOutlet weak var driverStatusView: UIView!
    @IBOutlet weak var driverStatusLabel: UILabel!
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var driverTopView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func setDesign(){
        driverTopView.setCorners()
        driverImage.makeCircle()
        driverStatusView.makeViewCircle()
        analyticsView.setCorners()
        dashboardView.setCorners()
        completedOrdersView.setCorners()
        currentOrdersView.setCorners()
    }
    
}
