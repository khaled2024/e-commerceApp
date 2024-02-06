//
//  TrackViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 27/01/2024.
//

import UIKit

class TrackViewController: UIViewController {

    @IBOutlet weak var clientBoxImage: UIImageView!
    @IBOutlet weak var wayImage: UIImageView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var trackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        
    }
    func setUpDesign(){
        clientBoxImage.layer.cornerRadius = 25
        wayImage.layer.cornerRadius = 25
        carImage.layer.cornerRadius = 25
        trackView.layer.cornerRadius = 20
    }

}
