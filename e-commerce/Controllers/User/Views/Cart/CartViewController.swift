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
    let refreshControl = UIRefreshControl()
    var cartItems: [UserCartData] = []
    let userCartVM = UserCartViewModel()
    var totalPrice: Int = 0
    var delivary: Int = 10
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        refreshControlSetUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if userCartVM.storageManager.isUserLogging(){
            // show the cart view for user and dismiss the popup View
            print("USER is Logging 🥳")
            self.showToast(message: "USER is Logging 🥳", font: .systemFont(ofSize: 16))
            getCartProduct()
        }else{
            // show pop up view with phone number:)
            showLoginPopUpView()
        }
    }
    // MARK: - Functions
    //API functions
    func getCartProduct(){
        self.totalPrice = 0
        if let loadedToken = userCartVM.storageManager.loadToken(){
            APIService.shared.fetchDataWithToken(url: Constants.TheUrl + Endpoint.Path.allCartProduct.rawValue, token: loadedToken) {[weak self] (cartData:UserCartModel?, error) in
                if let error = error{
                    print(error)
                }
                if let cartData = cartData?.data{
//                    print(cartData)
                    self?.cartItems = cartData
                    DispatchQueue.main.async {
                        let cartItems = self?.cartItems
                        self?.cartTableView.reloadData()
                        for cart in cartItems!{
                            self?.totalPrice  += cart.totalPrice
                        }
                        self?.delivaryLabel.text = String(self?.delivary ?? 10)
                        self?.totalItemLabel.text = String(self?.totalPrice ?? 0)
                        self?.totalPriceLabel.text = String((self?.totalPrice)! + (self?.delivary)! )
                    }
                }
            }
        }
    }
    // refresh Control
    func refreshControlSetUp(){
        self.refreshControl.addTarget(self, action: #selector(refreshTapped), for: .valueChanged)
        cartTableView.refreshControl = refreshControl
    }
    @objc func refreshTapped(){
        checkingUserLogging()
    }
    func checkingUserLogging(){
        if userCartVM.storageManager.isUserLogging(){
            getCartProduct()
            self.refreshControl.endRefreshing()
        }else{
            self.cartItems = []
            DispatchQueue.main.async {
                self.cartTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    // add and minues the product
    func updateTheProduct(with quantity: String,cartID: String){
        let param = [
            "quantity" : quantity
        ]
        guard let loadedToken = userCartVM.storageManager.loadToken() else{return}
        APIService.shared.postDataWithBody(url: Constants.TheUrl + Endpoint.Path.quantityUpdate.rawValue + cartID, token: loadedToken, param: param) { (userCartResponse: UserCartModel?, error) in
            if let error = error {
                print(error)
            }
            if let userCartResponse = userCartResponse{
                print(userCartResponse.message)
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                }
            }
        }
    }
    // design func
    private func setUpDesign(){
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartTableViewCell.uiNib(), forCellReuseIdentifier: CartTableViewCell.identifier)
        cartTableView.showsVerticalScrollIndicator = false
        cartTableView.separatorStyle = .none
        confirmBtn.layer.cornerRadius = 15
    }
    // logic func
    func getAdminTabbar(){
        userCartVM.navManager.show(screen: .adminTabbar, incontroller: self)
    }
    func showLoginPopUpView(){
        print("show pop up view with phone number:)")
        let popUpVC = userCartVM.navManager.instantiate(screen: .loginPopUp)as! POPUPVC
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.delegate = self
        self.present(popUpVC, animated: true)
    }
}
// MARK: -  extensions
extension CartViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("DEBUG PRINT: \(cartItems.count)")
        return cartItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath)as! CartTableViewCell
        // minus plus tapped
        cell.delegate = self
        cell.cartData = self.cartItems[indexPath.row]
        cell.setUpCartItem(cartItem: self.cartItems[indexPath.row].product)
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
    func didFinishLoggingUser() {
        self.getCartProduct()
    }
    func showToastMessage(message: String) {
        self.showToast(message: message, font: .systemFont(ofSize: 15))
    }
    func showAdminTabbar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: .init(block: { [weak self] in
            self?.getAdminTabbar()
        }))
    }
}
// MARK: - CartTableViewCellDelegate
extension CartViewController: CartTableViewCellDelegate{
    func plusTapped(cell: CartTableViewCell,sender: UIButton, quantity: String,cartID: String) {
        print("Quantity in func \(quantity)")
        self.updateTheProduct(with: quantity, cartID: cartID)
        self.getCartProduct()
        DispatchQueue.main.async {
            cell.numberLabel.text = quantity
            self.cartTableView.reloadData()
        }
    }
    func minusTapped(cell: CartTableViewCell,sender: UIButton, quantity: String,cartID: String) {
        print("Quantity in func \(quantity)")

        self.updateTheProduct(with: quantity, cartID: cartID)
        self.getCartProduct()
        DispatchQueue.main.async {
            cell.numberLabel.text = quantity
            self.cartTableView.reloadData()
        }
    }
    
}
