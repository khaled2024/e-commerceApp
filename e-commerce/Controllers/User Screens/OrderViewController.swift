//
//  OrderViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var oderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    func setUpTableView(){
        oderTableView.delegate = self
        oderTableView.dataSource = self
        oderTableView.register(OrdersTableViewCell.uiNib(), forCellReuseIdentifier: OrdersTableViewCell.identifier)
        oderTableView.showsHorizontalScrollIndicator = false
        oderTableView.showsVerticalScrollIndicator = false
        oderTableView.separatorStyle = .none
    }
}
// extensions
extension OrderViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = oderTableView.dequeueReusableCell(withIdentifier: OrdersTableViewCell.identifier, for: indexPath)as! OrdersTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped :)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
