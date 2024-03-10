//
//  DriverCurrentOrdersViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 10/03/2024.
//

import UIKit

class DriverCurrentOrdersViewController: UIViewController {
    // MARK: - Outlets :-
    @IBOutlet weak var driverCurrentOrderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var abonnementLabel: UILabel!
    @IBOutlet weak var driverStatusView: UIView!
    @IBOutlet weak var driverStatusLabel: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverImage: UIImageView!
    let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setUpDesign()
    }
    // MARK: - Functions :-
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrdersTableViewCell.uiNib(), forCellReuseIdentifier: OrdersTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    func setUpDesign(){
        driverCurrentOrderView.setCorners()
        driverImage.makeCircle()
        driverStatusView.makeViewCircle()
    }
}
// MARK: - Extensions :-
extension DriverCurrentOrdersViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverOrderModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrdersTableViewCell.identifier, for: indexPath)as! OrdersTableViewCell
        cell.trackBtn.isHidden = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("#\(driverOrderModels[indexPath.row].orderName)")
        let driverOrderDetails = navManager.instantiate(screen: .driverOrderDetails)as! OrderDetailsViewController
        driverOrderDetails.driverOrder = driverOrderModels[indexPath.row]
        navigationController?.pushViewController(driverOrderDetails, animated: true)
    }
}
