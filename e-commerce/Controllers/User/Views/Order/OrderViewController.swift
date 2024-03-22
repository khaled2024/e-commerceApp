//
//  OrderViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var oderTableView: UITableView!
    let storageManager = StorageManager()
    let navManager = NavigationManager()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUserLogging()
    }
    // MARK: - Functions
    func setUpTableView(){
        oderTableView.delegate = self
        oderTableView.dataSource = self
        oderTableView.register(OrdersTableViewCell.uiNib(), forCellReuseIdentifier: OrdersTableViewCell.identifier)
        oderTableView.showsHorizontalScrollIndicator = false
        oderTableView.showsVerticalScrollIndicator = false
        oderTableView.separatorStyle = .none
    }
    func showLoginPopUp(){
        let popUpVC = navManager.instantiate(screen: .loginPopUp)as! POPUPVC
        popUpVC.modalTransitionStyle = .crossDissolve
        self.present(popUpVC, animated: true)
    }
    func checkUserLogging(){
        if storageManager.isUserLogging(){
            self.showToast(message: "USER is Logging 🥳", font: .systemFont(ofSize: 16))
        }else{
            showLoginPopUp()
        }
    }
}
// MARK: - extensions
extension OrderViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = oderTableView.dequeueReusableCell(withIdentifier: OrdersTableViewCell.identifier, for: indexPath)as! OrdersTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped :)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
