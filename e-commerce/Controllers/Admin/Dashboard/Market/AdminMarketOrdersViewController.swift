//
//  AdminMarketOrdersViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/02/2024.
//

import UIKit

class AdminMarketOrdersViewController: UIViewController {
    
    
    var marketTitle: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view.backgroundColor = .tertiarySystemGroupedBackground
        navigationController?.navigationBar.tintColor = UIColor.black
        setData()
    }
    func setData(){
        self.title = marketTitle
    }
    
}
