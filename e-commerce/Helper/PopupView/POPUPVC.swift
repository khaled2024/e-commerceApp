//
//  POPUPView.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import UIKit
// MARK: - Protocol
protocol POPUPVCDelegate: AnyObject {
    func parseData()
}
class POPUPVC: UIViewController{
    // MARK: - Outlets
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneNumTF: UITextField!
    // MARK: - Variables
    static let identifier = String(describing: POPUPVC.self)
    weak var delegate: POPUPVCDelegate?
    let navManager = NavigationManager()
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.setUpLayers()
        loginBtn.layer.cornerRadius = 15
    }
    override func viewWillAppear(_ animated: Bool) {
        hidePasswordView()
    }
    // MARK: - Functions
    func hidePasswordView(){
        self.passwordLabel.isHidden = true
        self.passwordView.isHidden = true
    }
    func checkUserLogin(){
        if let phoneNum = phoneNumTF.text,
           phoneNum.isEmpty == false{
            // API Caller
            APIService.shared.userLogin(phone: phoneNum) { [weak self] loginData, loginError, error in
                if let error = error{
                    print("Apple Error: \(error.localizedDescription)")
                    let alert = UIAlertController.showAlert(title: "ERROR❌", message: error.localizedDescription)
                    // show the alert
                    self?.present(alert, animated: true, completion: nil)
                }
                else if let  loginError = loginError{
                    print("loginError: \(loginError.message)")
                }
                // Getting Success Data :-
                else{
                    if let loginData = loginData{
                        if loginData.status == "success"{
                            print(loginData)
                            // if the type is Admin Call The Delegate Back and present Admin Tabbar
                            if loginData.data?.type == "admin"{
                                print("TYPE : Admin")
                                self?.delegate?.parseData()
                            }
                            else if loginData.data?.type == "user"{
                                guard let userData = loginData.data else{return}
                                print("TYPE : User")
                                print(userData)
                                self?.dismiss(animated: true)
                            }
                        }
                        else{
                            print("loginData ERROR: \(loginData.message)")
                            // error with the password when Admin enter the phone the PasswordTF will appear
                            if loginData.error == 1{
                                let alert = UIAlertController.showAlert(title: "ERROR❌", message: loginData.message)
                                // show the alert
                                self?.present(alert, animated: true, completion: nil)
                                // create the alert
                                self?.passwordLabel.isHidden = false
                                self?.passwordView.isHidden = false
                            }
                            
                        }
                    }
                }
            }
        }
    }
    func checkAdminLogin(){
        if let password = passwordTF.text,
           let phoneNum = phoneNumTF.text{
            APIService.shared.adminLogin(phone: phoneNum, password: password) { [weak self] LoginData, loginError, error  in
                if let error = error{
                    print("Apple Error: \(error)")
                }else if let loginError = loginError{
                    print("loginError: \(loginError)")
                }else{
                    guard let loginData = LoginData else{return}
                    switch loginData.status {
                    case "success":
                        guard let adminData = loginData.data else{return}
                        print("admin Data \(adminData)")
                        self?.getAdminTabbar()
                    case "failed":
                        let errorAlert = UIAlertController.showAlert(title: "ERROR❌", message: loginData.message)
                        self?.present(errorAlert, animated: true)
                        print(loginData.message)
                    default:
                        print("Default Case")
                    }
                }
            }
        }
    }
    func getAdminTabbar(){
        navManager.show(screen: .adminTabbar, incontroller: self)
    }
    // MARK: - Actions
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        if passwordView.isHidden == false && passwordTF.text?.isEmpty == false{
            // call admin login
            print("Call the Admin api login")
            checkAdminLogin()
        }else{
            print("Call the User api login")
            checkUserLogin()
        }
    }
}
