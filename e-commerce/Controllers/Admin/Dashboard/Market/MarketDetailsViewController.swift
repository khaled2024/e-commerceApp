//
//  MarketDetailsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class MarketDetailsViewController: UIViewController {
    // outlets
    @IBOutlet weak var blockBtn: UIButton!
    @IBOutlet weak var marketNameLbl: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var marketDetailView: UIView!
    @IBOutlet weak var marketOrdersDashboard: UIView!
    @IBOutlet weak var marketUsersDashboard: UIView!
    @IBOutlet weak var marketDashboard: UIView!
    // scroll view items
    @IBOutlet weak var marketFoodTypeLbl: UILabel!
    @IBOutlet weak var marketCategoryLable: UILabel!
    @IBOutlet weak var marketEditView: UIView!
    @IBOutlet weak var marketImage: UIImageView!
    @IBOutlet weak var editMarketBtn: UIButton!
    // scroll view (TF)
    @IBOutlet weak var marketIDtextField: UITextField!
    @IBOutlet weak var commercialNumTF: UITextField!
    @IBOutlet weak var commercialNumView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var registrationDateView: UIView!
    @IBOutlet weak var registarationTF: UITextField!
    @IBOutlet weak var expireView: UIView!
    @IBOutlet weak var expireTF: UITextField!
    @IBOutlet weak var apiAdminTF: UITextField!
    @IBOutlet weak var cardNumTF: UITextField!
    @IBOutlet weak var cardHolderTF: UITextField!
    
    // variables :-
    var navManager = NavigationManager()
    var market: MarketModel!
    static let identifier = String(describing: MarketDetailsViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpdesign()
        setUpData()
        setupNavController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func setupNavController(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    // functions
    func setUpData(){
        self.marketNameLbl.text = market.marketName
        self.marketCategoryLable.text = market.marketCategory
        marketDetailView.layer.cornerRadius = 15
    }
    func setUpdesign(){
        self.blockBtn.layer.cornerRadius = 10
        marketOrdersDashboard.layer.cornerRadius = 15
        marketUsersDashboard.layer.cornerRadius = 15
        marketDashboard.layer.cornerRadius = 15
        setUpOutlets()
    }
    func setUpOutlets(){
        marketEditView.setCorners()
        editMarketBtn.setUpShadow(color: .darkGray)
        marketImage.makeCircle()
        marketIDtextField.setCorners()
        marketIDtextField.layer.masksToBounds = true
        commercialNumView.setCorners()
        addressView.setCorners()
        phoneView.setCorners()
        registrationDateView.setCorners()
        expireView.setCorners()
        apiAdminTF.setCorners()
        apiAdminTF.layer.masksToBounds = true
        cardNumTF.setCorners()
        cardNumTF.layer.masksToBounds = true
        cardHolderTF.setCorners()
        cardHolderTF.layer.masksToBounds = true
    }
    // Button Tapped
    @IBAction func dismissBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func blockBtnTapped(_ sender: UIButton) {
        print("Block")
    }
    
    @IBAction func marketOrdersBtnTapped(_ sender: UIButton) {
        print("orders of market")
        navManager.push(screen: .marketOrders, nav: navigationController)
    }
    
    @IBAction func marketUsersBtnTapped(_ sender: UIButton) {
        print("users of the market")
    }
    
    @IBAction func editMarketBtnTapped(_ sender: UIButton) {
        print("edit market :-")
        navManager.push(screen: .editMarket, nav: navigationController)
    }
    
}
