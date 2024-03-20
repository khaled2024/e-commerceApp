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
//        self.priceCartView.isHidden = true
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
