//
//  CartViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.

import UIKit
class CartViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var delivaryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var priceCartView: UIView!
    // MARK: - Vars
    let navManager = NavigationManager()
    let storageManager = StorageManager()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        /// TEST
        testForPopUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if storageManager.isUserLogging(){
            // show the cart view for user and dismiss the popup View
            print("USER is Logging 🥳")
            self.showToast(message: "USER is Logging 🥳", font: .systemFont(ofSize: 16))
        }else{
            // show pop up view with phone number:)
            showLoginPopUpView()
        }
    }
    // MARK: - Functions
    func getAdminTabbar(){
        navManager.show(screen: .adminTabbar, incontroller: self)
    }
    func showLoginPopUpView(){
        print("show pop up view with phone number:)")
        let popUpVC = navManager.instantiate(screen: .loginPopUp)as! POPUPVC
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.delegate = self
        self.present(popUpVC, animated: true)
    }
    func testForPopUpView(){
        self.cartTableView.isHidden = true
//      self.priceCartView.isHidden = true
    }
    private func setUpDesign(){
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
    func showToastMessage(message: String) {
        self.showToast(message: message, font: .systemFont(ofSize: 15))
    }
    func showAdminTabbar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: .init(block: { [weak self] in
            self?.getAdminTabbar()
        }))
    }
}
