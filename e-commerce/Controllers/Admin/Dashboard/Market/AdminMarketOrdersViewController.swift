//
//  AdminMarketOrdersViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/02/2024.
//

import UIKit

class AdminMarketOrdersViewController: UIViewController {
    @IBOutlet weak var marketOrdersName: UILabel!
    @IBOutlet weak var marketOrdersTableView: UITableView!

    var marketTitle: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor = .tertiarySystemGroupedBackground
        navigationController?.navigationBar.tintColor = UIColor.black
        setData()
        marketOrdersTableView.delegate = self
        marketOrdersTableView.dataSource = self
        marketOrdersTableView.register(MarketOrderTableViewCell.uiNib(), forCellReuseIdentifier: MarketOrderTableViewCell.identifier)
        marketOrdersTableView.showsVerticalScrollIndicator = false
        marketOrdersTableView.showsHorizontalScrollIndicator = false
        marketOrdersTableView.allowsSelection = false
        
    }
    func setData(){
        self.marketOrdersName.text = marketTitle
    }
    @IBAction func backBtnTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension AdminMarketOrdersViewController: UITableViewDelegate,UITableViewDataSource{
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
