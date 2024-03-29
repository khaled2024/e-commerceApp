//
//  CartViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var delivaryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var priceCartView: UIView!
    var showCart: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartTableViewCell.uiNib(), forCellReuseIdentifier: CartTableViewCell.identifier)
        cartTableView.showsVerticalScrollIndicator = false
        cartTableView.separatorStyle = .none
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /// TEST
        testForPopUpView()
        if showCart{
            // show cart view for user
        }else{
            // show pop up view with phone number:)
            print("show pop up view with phone number:)")
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: POPUPVC.identifier)as! POPUPVC
            popUpVC.modalTransitionStyle = .crossDissolve
            self.present(popUpVC, animated: true)
        }
    }
    // MARK: - Functions
   
    func testForPopUpView(){
        self.cartTableView.isHidden = true
        self.priceCartView.isHidden = true
        
    }
    func setUpDesign(){
        confirmBtn.layer.cornerRadius = 15
    }
}
// extensions
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
