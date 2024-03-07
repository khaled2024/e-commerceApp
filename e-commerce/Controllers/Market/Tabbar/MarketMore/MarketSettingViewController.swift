//
//  MarketSettingViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit

class MarketSettingViewController: UIViewController {
    static let identifier = String(describing: MarketSettingViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bacBtnTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
