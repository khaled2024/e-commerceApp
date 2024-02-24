//
//  ChatViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit

class ChatViewController: UIViewController {
    static let identifier = String(describing: ChatViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationItemBackground(hidden: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
