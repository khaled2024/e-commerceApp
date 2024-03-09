//
//  MarketProfileViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit

class MarketProfileViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var mainMarketImage: UIImageView!
    @IBOutlet weak var smallMarketImage: UIImageView!
    @IBOutlet weak var marketCoverImage: UIImageView!
    @IBOutlet weak var abonnementLabel: UILabel!
    @IBOutlet weak var marketStatusView: UIView!
    @IBOutlet weak var marketStatusLabel: UILabel!
    @IBOutlet weak var marketNameLabel: UILabel!
    @IBOutlet weak var marketProfileTopView: UIView!
    // scroll view items
    @IBOutlet weak var marketNameView: UIView!
    @IBOutlet weak var commercialMarketView: UIView!
    @IBOutlet weak var marketTypeView: UIView!
    @IBOutlet weak var marketStatusSwitch: UISwitch!
    @IBOutlet weak var registrationDateView: UIView!
    @IBOutlet weak var marketAddressView: UIView!
    @IBOutlet weak var expireDateView: UIView!
    @IBOutlet weak var phoneNumMarketView: UIView!
    // TFs
    @IBOutlet weak var apiAdminMarketTF: UITextField!
    @IBOutlet weak var marketNumberBranchTF: UITextField!
    @IBOutlet weak var marketBankNameTF: UITextField!
    @IBOutlet weak var marketNumAccountTF: UITextField!
    // MARK: - Vars
    static let identifier = String(describing: MarketProfileViewController.self)
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    // MARK: - Functions
    func setDesign(){
        marketProfileTopView.setCorners()
        marketStatusView.makeViewCircle()
        smallMarketImage.makeCircle()
        marketCoverImage.roundCorners(corners: .allCorners, radius: 10)
        mainMarketImage.makeCircle()
        mainMarketImage.layer.borderWidth = 3
        mainMarketImage.layer.borderColor = UIColor.white.cgColor
        marketNameView.setCorners(corner: 10)
        marketTypeView.setCorners(corner: 10)
        commercialMarketView.setCorners(corner: 10)
        marketAddressView.setCorners(corner: 10)
        phoneNumMarketView.setCorners(corner: 10)
        registrationDateView.setCorners(corner: 10)
        expireDateView.setCorners(corner: 10)
    }
    // MARK: - Actions
    @IBAction func editMarketPhoneNumberTapped(_ sender: UIButton) {
        print("Edit Market Number :)")
    }
}
