//
//  CostumerServicesViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class CostumerServicesViewController: UIViewController {
    @IBOutlet weak var customerServicesTableView: UITableView!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLable: UILabel!
    @IBOutlet weak var customerServicesView: UIView!
    private let navManager = NavigationManager()
    let identifier = String(describing: CostumerServicesViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        setUpDelegate()
        setUpCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = false

    }
    func setUpCells(){
        customerServicesTableView.register(CostumerTableViewCell.uiNib(), forCellReuseIdentifier: CostumerTableViewCell.identifier)
    }
    func setUpDesign(){
        badgeView.layer.cornerRadius = 15
        customerServicesView.layer.cornerRadius = 15
    }
    func setUpDelegate(){
        customerServicesTableView.delegate = self
        customerServicesTableView.dataSource = self
        customerServicesTableView.showsVerticalScrollIndicator = false
        customerServicesTableView.showsHorizontalScrollIndicator = false
        customerServicesTableView.separatorStyle = .none
    }
}
// UITableViewDataSource :-
extension CostumerServicesViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costumers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CostumerTableViewCell", for: indexPath)as! CostumerTableViewCell
        cell.config(with: costumers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let costumer = costumers[indexPath.row]
        print(costumer.name)
        let chatRoomVC = navManager.instantiate(screen: .chatRoom)as! ChatRoomViewController
        navigationController?.pushViewController(chatRoomVC, animated: true)
        chatRoomVC.user = costumer
        
    }
    
}
