//
//  MarketMoreViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit

class MarketMoreViewController: UIViewController {
    
    let navManager = NavigationManager()
    @IBOutlet weak var moreTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        moreTableView.delegate = self
        moreTableView.dataSource = self
        moreTableView.separatorStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
// MARK: - MoreTableViewCell
extension MarketMoreViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketMoreModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
            cell.config(with: marketMoreModels[indexPath.row])
        if indexPath.row == 3{
            cell.moreimage.image = UIImage(named: marketMoreModels[indexPath.row].image)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            navManager.push(screen: .marketSetting, nav: navigationController)
        }else if indexPath.row == 1{
            print("Profile Tapped")
        }
        else if indexPath.row == 2{
            print("Statistics Tapped")
        }else{
            print("Announcement")
        }
    }
}

