//
//  SettingViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class SettingViewController: UIViewController {

    static let identifier = "SettingViewController"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
