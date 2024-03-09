//
//  AddMealViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 09/03/2024.
//

import UIKit

class AddMealViewController: UIViewController {

    // MARK: - Outlets and Vars
    @IBOutlet weak var abonnementLabel: UILabel!
    @IBOutlet weak var marketstatusView: UIView!
    @IBOutlet weak var marketStatusLabel: UILabel!
    @IBOutlet weak var marketNameLabel: UILabel!
    @IBOutlet weak var marketImage: UIImageView!
    @IBOutlet weak var confirmTheMeal: UIButton!
    @IBOutlet weak var switchStatus: UISwitch!
    @IBOutlet weak var addsView: UIView!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var mealNameTF: UITextField!
    @IBOutlet weak var addImageView: UIView!
    @IBOutlet weak var addMealMarketTopView: UIView!
    static let identifier = String(describing: AddMealViewController.self)
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    // MARK: - Functions
    func setUpDesign(){
        addMealMarketTopView.setCorners()
        marketstatusView.makeViewCircle()
        addImageView.setCorners()
        marketImage.makeCircle()
        mealNameTF.setCorners()
        priceTF.setCorners()
        descriptionTF.setCorners()
        addsView.setCorners(corner: 10)
        confirmTheMeal.setCorners(corner: 10)
    }
    // MARK: - Actions
    @IBAction func addImageBtnTapped(_ sender: UIButton) {
        print("Image Picker Tapped")
    }
    @IBAction func addAddsBtnTapped(_ sender: UIButton) {
        print("Adds Tapped")
        
    }
    @IBAction func confirmTheMealBtnTapped(_ sender: UIButton) {
        print("confirm The Meal")
    }
}
