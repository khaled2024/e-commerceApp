//
//  ChatRoomViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit

class ChatRoomViewController: UIViewController {
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageView: UIView!
    static let identifier = String(describing: ChatRoomViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUpLogic()
        setUpDesign()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    func setUpDesign(){
        userView.layer.cornerRadius = 15
        messageView.setUpLayers()
        userImage.layer.cornerRadius = userImage.frame.height/2
    }
    func setUpLogic(){
    }
    func setUpData(){
        
    }
    // btn tapped :-
    @IBAction func dismissBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
