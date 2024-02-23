//
//  MarketDetailsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class MarketDetailsViewController: UIViewController {
    
    @IBOutlet weak var blockBtn: UIButton!
    @IBOutlet weak var marketNameLbl: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var marketDetailView: UIView!
    
    var market: MarketModel!
    static let identifier = String(describing: MarketDetailsViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpdesign()
        setUpData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    // functions
    func setUpData(){
        self.marketNameLbl.text = market.marketName
        marketDetailView.layer.cornerRadius = 15
    }
    func setUpdesign(){
        self.blockBtn.layer.cornerRadius = 15
    }
    // Button Tapped
    @IBAction func dismissBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func blockBtnTapped(_ sender: UIButton) {
        print("Block")
    }
    
    
    
    
}
