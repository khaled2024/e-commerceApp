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
    static let identifier = String(describing: ChatViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        chatView.layer.cornerRadius = 15
        badgeView.layer.cornerRadius = badgeView.frame.height/2

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationItemBackground(hidden: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

}
