//
//  BlockMarketViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class AdminBlockMarketViewController: UIViewController {
    static let identifier = "AdminBlockMarketViewController"
    @IBOutlet weak var blockMarketTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    func setUpTableView(){
        self.blockMarketTableView.delegate = self
        self.blockMarketTableView.dataSource = self
        self.blockMarketTableView.showsVerticalScrollIndicator = false
        self.blockMarketTableView.showsHorizontalScrollIndicator = false
        self.blockMarketTableView.separatorStyle = .none
        self.blockMarketTableView.register(BlockMarketTableViewCell.uiNib(), forCellReuseIdentifier: BlockMarketTableViewCell.identifier)
    }
    // MARK: - IBActions
    @IBAction func backBtnTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - extensions
extension AdminBlockMarketViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlockMarketTableViewCell.identifier, for: indexPath)as! BlockMarketTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("select item # \(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
