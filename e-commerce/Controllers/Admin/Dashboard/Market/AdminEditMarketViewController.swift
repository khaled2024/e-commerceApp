//
//  AdminEditMarketViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class AdminEditMarketViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var imageMarket: UIImageView!
    @IBOutlet weak var editCoverimage: UIButton!
    @IBOutlet weak var marketCoverImage: UIImageView!
    @IBOutlet weak var editMarketImage: UIButton!
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var marketNameView: UIView!
    @IBOutlet weak var marketTypeView: UIView!
    @IBOutlet weak var commercialView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var expireView: UIView!
    
    @IBOutlet weak var cardHolderTF: UITextField!
    @IBOutlet weak var cardNumTF: UITextField!
    @IBOutlet weak var apiAdminTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpDesign()
    }
    func setUpDesign(){
        self.marketCoverImage.setCorners()
        self.editCoverimage.makeCircle()
        self.editMarketImage.makeCircle()
        self.imageMarket.makeCircle()
        self.imageMarket.layer.borderWidth = 5
        self.imageMarket.layer.borderColor = UIColor.white.cgColor
        // Views
        marketNameView.setCorners()
        marketTypeView.setCorners()
        commercialView.setCorners()
        addressView.setCorners()
        phoneView.setCorners()
        registrationView.setCorners()
        expireView.setCorners()
        // TF
        apiAdminTF.layer.masksToBounds = true
        cardNumTF.setCorners()
        cardNumTF.layer.masksToBounds = true
        cardHolderTF.setCorners()
        cardHolderTF.layer.masksToBounds = true
        // Buttons
        saveBtn.layer.cornerRadius = 10
        cancleBtn.setUpLayer(size: 10, borderColor: UIColor.systemOrange.cgColor, borderWidth: 2)
        
    }
    // MARK: - BtnTapped
    @IBAction func cancleBtnTapped(_ sender: UIButton) {
    }
    @IBAction func saveBtnTapped(_ sender: UIButton) {
    }
    @IBAction func editMarketCoverTapped(_ sender: UIButton) {
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
