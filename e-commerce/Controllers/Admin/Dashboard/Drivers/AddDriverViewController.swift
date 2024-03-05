//
//  AddDriverViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class AddDriverViewController: UIViewController {

    @IBOutlet weak var editProfileImageBtn: UIButton!
    @IBOutlet weak var driverImageView: UIImageView!
    @IBOutlet weak var driverProfileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    func setUpDesign(){
        self.view.backgroundColor = .tertiarySystemGroupedBackground
        self.driverImageView.makeCircle()
        self.editProfileImageBtn.makeCircle()
        self.driverProfileView.setCorners()
    }
    
    // MARK: - Btns tapped
    @IBAction func editProfileBtnTapped(_ sender: UIButton) {
        print("Edit profile tapped :-")
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
