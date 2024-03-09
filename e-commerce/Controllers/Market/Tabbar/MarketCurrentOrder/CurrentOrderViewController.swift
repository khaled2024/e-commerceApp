//
//  CurrentOrderViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 06/03/2024.
//

import UIKit
import MapKit
class CurrentOrderViewController: UIViewController {
    @IBOutlet weak var currentOrderTopView: UIView!
    
    @IBOutlet weak var currentOrderImage: UIImageView!
    @IBOutlet weak var orderRecevingBtn: UIButton!
    @IBOutlet weak var locationMapView: MKMapView!
    @IBOutlet weak var oderDetailsView: UIView!
    @IBOutlet weak var orderName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
        setDesign()
    }
    func setDesign(){
        currentOrderTopView.setCorners()
        oderDetailsView.setCorners()
        oderDetailsView.setUpShadoww(shadowColor: UIColor.black.cgColor)
        oderDetailsView.layer.borderWidth = 0.2
        oderDetailsView.layer.borderColor = UIColor.black.cgColor
        locationMapView.backgroundColor = .tertiarySystemGroupedBackground
        orderRecevingBtn.setCorners(corner: 10)
        currentOrderImage.makeCircle()
    }
    func setNav(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.setNavigationItemBackground(hidden: true)
    }
    @IBAction func orderRecevingBtnTapped(_ sender: UIButton) {
        print("Order Receving :(")
    }
}
