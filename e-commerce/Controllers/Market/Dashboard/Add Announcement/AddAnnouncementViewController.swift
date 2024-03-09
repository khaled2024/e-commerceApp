//
//  AddAnnouncementViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 09/03/2024.
//

import UIKit

class AddAnnouncementViewController: UIViewController {
    @IBOutlet weak var addannouncementTopView: UIView!
    
    @IBOutlet weak var puplishBtn: UIButton!
    @IBOutlet weak var announcementNameTF: UITextField!
    @IBOutlet weak var addPictureView: UIView!
    static let identifier = String(describing: AddAnnouncementViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        addannouncementTopView.setCorners()
        announcementNameTF.setCorners()
        addPictureView.setCorners()
        puplishBtn.layer.cornerRadius = 10
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func puplishBtnTapped(_ sender: UIButton) {
    }
    
}
