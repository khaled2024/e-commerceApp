//
//  POPUPView.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//

import UIKit
// MARK: - Protocol
protocol POPUPVCDelegate: AnyObject {
    func showAdminTabbar()
    func showToastMessage(message: String)
    func didFinishLoggingUser()
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
    var ViewModel = PopupViewModel()
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
    // MARK: - checkUserLogin
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
                else{
                    if let loginData = loginData{
                        // Getting Success Data :-
                        if loginData.status == "success"{
                            // if the type is Admin Call The Delegate Back and present Admin Tabbar (he is Admin)
                            if loginData.data?.type == "admin"{
                                print("TYPE : Admin")
                                self?.ViewModel.storageManager.saveAdminLogging(true)
                                self?.delegate?.showAdminTabbar()
                            }
                            // (he is User)
                            else if loginData.data?.type == "user"{
                                guard let userData = loginData.data else{return}
                                guard let token = userData.token else{return}
                                self?.ViewModel.storageManager.saveUserLogging(true)
                                guard let tokenData = token.data(using: .utf8)else{return}
                                let _ = Keychain.save(key: Constants.KeyChain.token.rawValue, data: tokenData)
                                print(tokenData)
                                print("TYPE : User")
                                print(userData)
                                print("User logging is 'TRUE'")
                                self?.dismiss(animated: true)
                                self?.delegate?.showToastMessage(message: "Congratulations🥳")
                                self?.delegate?.didFinishLoggingUser()
                            }
                        }
                        // // Getting failed Data :-
                        else{
                            print("loginData ERROR: \(loginData.message)")
                            // error with the password when Admin enter the phone the PasswordTF will appear
                            self?.showToast(message: "\(loginData.message) ❌", font: .systemFont(ofSize: 16))
                            if loginData.error == 1{
                                // here the password field is required
                                UIView.animate(withDuration: 1.0, delay: 0.5,options: .transitionCurlDown) {
                                    self?.passwordLabel.isHidden = false
                                    self?.passwordView.isHidden = false
                                }
                            }else if loginData.error == 400{
                                // first check phoneTF
                                // User Not Registered
                                guard let phone = self?.phoneNumTF.text,phone.count == 11 else{
                                    print("phone must be 11 number")
                                    return
                                }
                                print("error 400")
                                self?.checkUserRegisterAndLogin()
                            }
                        }
                    }
                }
            }
        }
    }
    func checkUserRegisterAndLogin(){
        // register and login then store the user logging in boolean func
        guard let phone = phoneNumTF.text,phone.count == 11 else{return}
        APIService.shared.userRegister(phone: phone) { [weak self] registerData, registerError, error in
            if let error = error{
                self?.showToast(message: error.localizedDescription, font: .systemFont(ofSize: 16))
                print(error)
            }else if let registerError = registerError{
                self?.showToast(message: registerError.message, font: .systemFont(ofSize: 16))
            }else{
                guard let registerData = registerData else{return}
                // here login again after registeration
                APIService.shared.userLogin(phone: phone) {[weak self] loginData, loginError, error in
                    if let error = error{
                        self?.showToast(message: error.localizedDescription, font: .systemFont(ofSize: 16))
                        print(error)
                    }else if let registerError = registerError{
                        self?.showToast(message: registerError.message, font: .systemFont(ofSize: 16))
                    }else{
                        guard let loginData = loginData else{return}
                        guard let userData = loginData.data else{return}
                        guard let token = userData.token else{return}
                        self?.ViewModel.storageManager.saveUserLogging(true)
                        guard let tokenData = token.data(using: .utf8)else{return}
                        let _ = Keychain.save(key: Constants.KeyChain.token.rawValue, data: tokenData)
                        self?.delegate?.showToastMessage(message: "Congratulations🥳")
                        print(userData)
                        print("User logging is 'TRUE'")
                        self?.dismiss(animated: true)
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
                        let type = adminData.type
                        if type == "admin"{
                            print("admin Data \(adminData)")
                            self?.getAdminTabbar()
                            self?.ViewModel.storageManager.saveAdminLogging(true)
                        }else{
                            self?.present(UIAlertController.showAlert(title: "ERROR❌", message: "Please enter valid admin phone number"), animated: true)
                            print("DEBUG PRINT: Here when the enterer enter password for user phone number")
                            // TODO: can add else if type == user here and validate and cash the user data
                        #warning("to me i can add else if type == user here and validate and cash the user data :)")
                        }
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
        ViewModel.navManager.show(screen: .adminTabbar, incontroller: self)
    }
    func validateTextFields(){
        if phoneNumTF.text?.count == 11{
            if passwordTF.text == "" && passwordView.isHidden == false{
                self.present(UIAlertController.showAlert(title: "ERROR❌", message: "Please enter a Password"), animated: true)
            }
            else if passwordView.isHidden == false && passwordTF.text?.isEmpty == false{
                // call admin login
                print("Call the Admin api login")
                checkAdminLogin()
            }else{
                print("Call the User api login")
                checkUserLogin()
            }
        }else{
            self.showToast(message: "Phone number must be 11 digits ", font: .systemFont(ofSize: 16))
        }
        
    }
    // MARK: - Actions
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        sender.ForBtnBig { [weak self] in
            self?.validateTextFields()
        }
    }
    // for closing the PopUpView
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
