//
//  ChatViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var chatTableView: UITableView!
    static let identifier = String(describing: ChatViewController.self)
    private let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUpDesign()
        setUpCells()
        // Do any additional setup after loading the view.
    }
    func setUpCells(){
        chatTableView.register(CostumerTableViewCell.uiNib(), forCellReuseIdentifier: CostumerTableViewCell.identifier)
    }
    func setUpData(){
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none
    }
    func setUpDesign(){
        chatView.layer.cornerRadius = 15
        badgeView.layer.cornerRadius = badgeView.frame.height/2
        segmentController.layer.cornerRadius = 30
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal) // Change UIColor.red to your desired color
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected) // Change UIColor.blue to your desired color
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationItemBackground(hidden: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        chatTableView.reloadData()
    }
    
}
// (UITableViewDelegate) , (UITableViewDataSource)
extension ChatViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentController.selectedSegmentIndex == 0{
            return marketUsers.count
        }else{
            return drivers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CostumerTableViewCell", for: indexPath)as! CostumerTableViewCell
        if segmentController.selectedSegmentIndex == 0{
            cell.config(with: marketUsers[indexPath.row])
        }else{
            cell.config(with: drivers[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chatRoomVC = navManager.instantiate(screen: .chatRoom)as! ChatRoomViewController
        switch segmentController.selectedSegmentIndex{
        case 0:
            let marketUser = marketUsers[indexPath.row]
            chatRoomVC.user = marketUser
        case 1:
            let drivers = drivers[indexPath.row]
            chatRoomVC.user = drivers
        default:
            break
        }
        navigationController?.pushViewController(chatRoomVC, animated: true)
    }
}
