//
//  POPUPView.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import UIKit
protocol POPUPVCDelegate: AnyObject {
    func parseData()
}
class POPUPVC: UIViewController{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneNumTF: UITextField!
    static let identifier = String(describing: POPUPVC.self)
    weak var delegate: POPUPVCDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.setUpLayers()
        loginBtn.layer.cornerRadius = 15
    }
    func checkLogin(){
        if let password = passwordTF.text,
           password.isEmpty == false,
           let phoneNum = phoneNumTF.text,
           phoneNum.isEmpty == false{
            APIService.shared.makePostRequest(phone: phoneNum, password: password) {[weak self] loginData, loginError, error in
                if let error = error{
                    print("DEBUG PRINT: \(error.localizedDescription)")
                    let alert = UIAlertController.showAlert(title: "ERROR❌", message: error.localizedDescription)
                    // show the alert
                    self?.present(alert, animated: true, completion: nil)
                }else if let  loginError = loginError{
                    print("DEBUG PRINT: \(loginError.message)")
                    // Getting Success Data :-
                }else{
                    if let loginData = loginData{
                        if loginData.status == "success"{
                            print(loginData)
                            self?.dismiss(animated: true)
                            if loginData.data?.type == "admin"{
                                print("TYPE : admin")
                                self?.delegate?.parseData()
                            }
                        }else{
                            print("DEBUG PRINT: \(loginData.message)")
                            // create the alert
                            let alert = UIAlertController.showAlert(title: "ERROR❌", message: loginData.message)
                            // show the alert
                            self?.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
    func getAdminTabbar(){
        let adminTabbar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminTabBarController")as! AdminTabBarController
        // Create a UIWindow instance and set its root view controller
        adminTabbar.modalPresentationStyle = .fullScreen
        adminTabbar.modalTransitionStyle = .flipHorizontal
        self.present(adminTabbar, animated: true)
        
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        checkLogin()
    }
}
