//
//  MarketAnnouncementViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit

class MarketAnnouncementViewController: UIViewController {
    
    @IBOutlet weak var announcementTopView: UIView!
    @IBOutlet weak var announcementTableView: UITableView!
    static let identifier = String(describing: MarketAnnouncementViewController.self)
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        announcementTopView.setCorners()
    }
    func setUpTableView(){
        announcementTableView.delegate = self
        announcementTableView.dataSource = self
        announcementTableView.showsVerticalScrollIndicator = false
        announcementTableView.showsHorizontalScrollIndicator = false
        announcementTableView.allowsSelection = false
        announcementTableView.separatorStyle = .none
        announcementTableView.register(MarketAnnouncementTableViewCell.uiNib(), forCellReuseIdentifier: MarketAnnouncementTableViewCell.identifier)
    }
    // MARK: - Actions:-
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension MarketAnnouncementViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketAnnouncementTableViewCell.identifier, for: indexPath)as! MarketAnnouncementTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    
}
