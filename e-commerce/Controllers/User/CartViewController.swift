//
//  CartViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.
//

import UIKit
class CartViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var delivaryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var priceCartView: UIView!
    var showCart: Bool = false
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /// TEST
        testForPopUpView()
        if showCart{
            // show cart view for user
        }else{
            // show pop up view with phone number:)
            showLoginPopUpView()
        }
    }
    // MARK: - Functions
    func getAdminTabbar(){
        /// First Way
//        let adminTabbar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminTabBarController")as! AdminTabBarController
//        // Create a UIWindow instance and set its root view controller
//        adminTabbar.modalPresentationStyle = .fullScreen
//        adminTabbar.modalTransitionStyle = .flipHorizontal
//        self.present(adminTabbar, animated: true)
        
        /// Second Way
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            // Now you have access to the window
            let adminRootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminTabBarController")as! AdminTabBarController
            adminRootVC.view.layoutIfNeeded()
            adminRootVC.modalTransitionStyle = .flipHorizontal
            window.rootViewController = adminRootVC
            window.makeKeyAndVisible()
        }
    }
    func showLoginPopUpView(){
        print("show pop up view with phone number:)")
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: POPUPVC.identifier)as! POPUPVC
        popUpVC.delegate = self
        popUpVC.modalTransitionStyle = .crossDissolve
        self.present(popUpVC, animated: true)
    }
    func loginWithCodable(){
        let loginBody = loginBody(phone: "01147507444", password: "123456789")
        guard let request = Endpoint.login(login: loginBody).request else {return}
        APIService.shared.makeRequest(with: request, respModel: LoginData.self) { result, error in
            if let error = error{
                print("DEBUG PRINT: \(error)")
            }
            guard let result = result else{return}
            print("DEBUG PRINT: \(result)")
        }
    }
    func testForPopUpView(){
        self.cartTableView.isHidden = true
        self.priceCartView.isHidden = true
    }
    private func setUp(){
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartTableViewCell.uiNib(), forCellReuseIdentifier: CartTableViewCell.identifier)
        cartTableView.showsVerticalScrollIndicator = false
        cartTableView.separatorStyle = .none
        confirmBtn.layer.cornerRadius = 15
    }
}
// MARK: -  extensions
extension CartViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath)as! CartTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
// MARK: - POPUPVCDelegate
extension CartViewController: POPUPVCDelegate{
    func parseData() {
        getAdminTabbar()
    }
}
