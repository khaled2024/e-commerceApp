//
//  OrdersTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    @IBOutlet weak var addressName: UILabel!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var orderimage: UIImageView!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var trackBtn: UIButton!
    
    static let identifier = String(describing: OrdersTableViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: OrdersTableViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        orderimage.layer.cornerRadius = 30
        orderView.setUpLayerForCell()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
