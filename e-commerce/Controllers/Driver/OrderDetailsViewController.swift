//
//  OrderDetailsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 11/03/2024.
//

import UIKit
import MapKit
class OrderDetailsViewController: UIViewController {
    @IBOutlet weak var locationMapView: MKMapView!
    @IBOutlet weak var recievingOrderBtn: UIButton!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderDetailsTopView: UIView!
    
    @IBOutlet weak var orderDetailsView: UIView!
    var driverOrder: DriverOrderModel? = nil
    static let identifier = String(describing: OrderDetailsViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        if let driverOrder = self.driverOrder{
            print(driverOrder)
        }
        orderDetailsTopView.setCorners()
        orderDetailsView.setCorners()
        orderImage.makeCircle()
        recievingOrderBtn.setCorners(corner: 10)
        locationMapView.layer.cornerRadius = 15
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func recievingOrderBtnTapped(_ sender: UIButton) {
    }
}
