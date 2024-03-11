//
//  DriverSettingViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 11/03/2024.
//

import UIKit

class DriverSettingViewController: UIViewController {
    
    static let identifier = String(describing: DriverSettingViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
