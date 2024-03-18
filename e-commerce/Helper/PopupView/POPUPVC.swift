//
//  POPUPView.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import UIKit
class POPUPVC: UIViewController{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneNumTF: UITextField!
    static let identifier = String(describing: POPUPVC.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.setUpLayers()
        loginBtn.layer.cornerRadius = 15
    }
    func validate()-> Bool{
        if let password = passwordTF.text,
           password.isEmpty == false,
           let phoneNum = phoneNumTF.text,
           phoneNum.isEmpty == false{
            return true
        }else{
            return false
        }
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        print("Login Tapped")
        if validate(){
            self.dismiss(animated: true)
        }else{
            print("ERROR")
            
        }
    }
}

