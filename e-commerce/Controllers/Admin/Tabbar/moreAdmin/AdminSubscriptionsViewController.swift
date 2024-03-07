//
//  SubscriptionsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class AdminSubscriptionsViewController: UIViewController {

    @IBOutlet weak var SubscriptionsTableView: UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    static let identifier = "AdminSubscriptionsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegment()
        setUpTableView()
    }
    // MARK: - Functions
    func setUpTableView(){
        SubscriptionsTableView.delegate = self
        SubscriptionsTableView.dataSource = self
        SubscriptionsTableView.register(SubscriptionsTableViewCell.uiNib(), forCellReuseIdentifier: SubscriptionsTableViewCell.identifier)
        SubscriptionsTableView.showsVerticalScrollIndicator = false
        SubscriptionsTableView.showsHorizontalScrollIndicator = false
        SubscriptionsTableView.separatorStyle = .none
    }
    func setUpSegment(){
        segmentController.layer.cornerRadius = 30
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal) // Change UIColor.red to your desired color
        segmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected) // Change
    }
    // MARK: - Button Tapped

    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        print("Tapped")
    }
}
// MARK: - UITableViewDelegate,UITableViewDataSource
extension AdminSubscriptionsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionsTableViewCell.identifier, for: indexPath)as! SubscriptionsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
