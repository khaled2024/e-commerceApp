//
//  MarketOrdersViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 08/03/2024.
//

import UIKit

class MarketOrdersViewController: UIViewController {
    // MARK: - Outlets & Vars
    @IBOutlet weak var marketOrderView: UIView!
    @IBOutlet weak var marketOrderTableView: UITableView!
    @IBOutlet weak var marketOrderSegmentController: UISegmentedControl!
    static let identifier = String(describing: MarketOrdersViewController.self)
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpsegment()
        setUpTableView()
        marketOrderView.setCorners()
    }
    // MARK: -  functions
    func setUpsegment(){
        marketOrderSegmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal) // Change UIColor.red to your desired color
        marketOrderSegmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected) // Change UIColor.blue to your desired color
        marketOrderSegmentController.layer.cornerRadius = 20
    }
    func setUpTableView(){
        marketOrderTableView.delegate = self
        marketOrderTableView.dataSource = self
        marketOrderTableView.register(MarketOrderTableViewCell.uiNib(), forCellReuseIdentifier: MarketOrderTableViewCell.identifier)
        marketOrderTableView.showsVerticalScrollIndicator = false
        marketOrderTableView.showsHorizontalScrollIndicator = false
        marketOrderTableView.allowsSelection = false
    }
    
    // MARK: - actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension MarketOrdersViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketOrderTableViewCell.identifier, for: indexPath)as! MarketOrderTableViewCell
        cell.config(with: marketOrders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
