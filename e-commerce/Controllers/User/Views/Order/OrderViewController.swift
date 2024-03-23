//
//  OrderViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - Outlets & Vars
    @IBOutlet weak var oderTableView: UITableView!
    let storageManager = StorageManager()
    let navManager = NavigationManager()
    var userOrders: [UserOrderData] = []
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUserLogging()
        getAllOrders()
    }
    // MARK: - Design Functions
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
    // MARK: - API Functions
    func checkUserLogging(){
        setUpTableView()
        if storageManager.isUserLogging(){
            self.showToast(message: "USER is Logging 🥳", font: .systemFont(ofSize: 16))
        }else{
            showLoginPopUp()
        }
    }
    func getAllOrders(){
        guard let loadedToken = storageManager.loadToken() else{return}
        APIService.shared.fetchDataWithToken(url: Constants.TheUrl + Endpoint.Path.allUserOrders.rawValue, token: loadedToken) { (userOrderModel:UserOrderModel?, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            if let userOrderModel = userOrderModel{
                print("DEBUG PRINT: \(userOrderModel)")
                self.userOrders = userOrderModel.data
                DispatchQueue.main.async {
                    self.oderTableView.reloadData()
                }
            }
        }
    }
}
// MARK: - extensions
extension OrderViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userOrders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = oderTableView.dequeueReusableCell(withIdentifier: OrdersTableViewCell.identifier, for: indexPath)as! OrdersTableViewCell
        let orderModel = self.userOrders[indexPath.row]
        guard let order = orderModel.cart.first else{return cell}
            cell.addressName.text = orderModel.address 
            cell.orderName.text = order.product.name
            cell.marketName.text = order.product.nameMarket
            cell.orderimage.loadDataUsingCacheWithUrlString(urlString: order.product.image.image)
            return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let order = self.userOrders[indexPath.row].cart.first{
            print("tapped \(order.product.name)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
