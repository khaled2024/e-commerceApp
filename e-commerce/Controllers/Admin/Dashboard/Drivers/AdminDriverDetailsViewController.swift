//
//  DriverDetailsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class AdminDriverDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageeditBtn: UIButton!
    @IBOutlet weak var driverImage: UIImageView!
    
    
    // MARK: - Views
    @IBOutlet weak var driverNameView: UIView!
    @IBOutlet weak var vehicleNumView: UIView!
    @IBOutlet weak var expiryDateView: UIView!
    @IBOutlet weak var registrationDateView: UIView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var subscriptionView: UIView!
    @IBOutlet weak var phoneNumView: UIView!
    @IBOutlet weak var addressView: UIView!
    // MARK: - Buttons Scroll View :-
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancleBtn: UIButton!
    
    // MARK: - TFs :-
    @IBOutlet weak var driverIDTF: UITextField!
    @IBOutlet weak var CvvTF: UITextField!
    @IBOutlet weak var cardHolderTF: UITextField!
    @IBOutlet weak var cardNumberTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var validIntilTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    
    static let identifier = "AdminDriverDetailsViewController"
    var driver: DriverModel?
    // MARK: -  life cycle :-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        setUpdata()
    }
    func setUpDesign(){
        self.view.backgroundColor = .white
        driverImage.makeCircle()
        imageeditBtn.makeCircle()
        // TFs
        CvvTF.layer.masksToBounds = true
        CvvTF.setCorners()
        cardHolderTF.layer.masksToBounds = true
        cardHolderTF.setCorners()
        cardNumberTF.layer.masksToBounds = true
        cardNumberTF.setCorners()
        yearTF.layer.masksToBounds = true
        yearTF.setCorners()
        validIntilTF.layer.masksToBounds = true
        validIntilTF.setCorners()
        monthTF.layer.masksToBounds = true
        monthTF.setCorners()
        birthdayTF.layer.masksToBounds = true
        birthdayTF.setCorners()
        driverIDTF.layer.masksToBounds = true
        driverIDTF.setCorners()
        // Views
        driverNameView.setCorners()
        vehicleNumView.setCorners()
        subscriptionView.setCorners()
        addressView.setCorners()
        phoneNumView.setCorners()
        orderView.setCorners()
        registrationDateView.setCorners()
        expiryDateView.setCorners()
        // button
        saveBtn.layer.cornerRadius = 10
        cancleBtn.setUpLayer(size: 10, borderColor: UIColor.systemOrange.cgColor, borderWidth: 2)
    }
    func setUpdata(){
        if let driver = self.driver{
            self.driverImage.image = driver.driverImage
        }
    }
    // MARK: - Actions
    @IBAction func imageEditBtnTapped(_ sender: UIButton) {
        print("Tapped")
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func saveBtnTapped(_ sender: UIButton){
        print("Save")
    }
    @IBAction func cancleBtnTapped(_ sender: UIButton){
        print("Cancle")
    }
    
}
