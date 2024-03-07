//
//  MoreViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/02/2024.
//

import UIKit

class AdminMoreViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var moreTableView: UITableView!
    let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        moreTableView.delegate = self
        moreTableView.dataSource = self
        moreTableView.separatorStyle = .none
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }
}
// MARK: - MoreTableViewCell
extension AdminMoreViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        switch indexPath.row{
        case 0,1:
            cell.badgeView.isHidden = true
            cell.badgeLabel.isHidden = true
            cell.config(with: moreModels[indexPath.row])
        case 2,3:
            cell.config(with: moreModels[indexPath.row])
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            navManager.push(screen: .adminSettingVC, nav: navigationController)
        }else if indexPath.row == 1{
            print("Notifications Tapped")
        }
        else if indexPath.row == 2{
            navManager.push(screen: .adminSubscriptionsVC, nav: navigationController)
        }else{
            navManager.push(screen: .adminBlockMarketVC, nav: navigationController)
            print("Block Market Tapped")
        }
    }
}
