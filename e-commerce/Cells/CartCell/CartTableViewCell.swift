//
//  CartTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var trashBtn: UIButton!
    @IBOutlet weak var trashView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var nameObject: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var cartView: UIView!
    static let identifier = String(describing: CartTableViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: CartTableViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        trashView.layer.cornerRadius = 5
        trashView.layer.shadowColor = UIColor.darkGray.cgColor
        trashView.layer.shadowRadius = 2
        trashView.layer.shadowOpacity = 3
        trashView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        itemImage.layer.cornerRadius = 10
        cartView.layer.cornerRadius = 10
        cartView.layer.shadowColor = UIColor.orange.withAlphaComponent(0.5).cgColor
        cartView.layer.shadowRadius = 2
        cartView.layer.shadowOpacity = 3
        cartView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
