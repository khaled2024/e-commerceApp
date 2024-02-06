//
//  IngredientsTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var ingradientView: UIView!
    
    @IBOutlet weak var itemImage: UIImageView!
    static let identifier = String(describing: IngredientsTableViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: IngredientsTableViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ingradientView.layer.cornerRadius = 10
        ingradientView.layer.borderColor = UIColor.darkGray.cgColor
        ingradientView.layer.borderWidth = 1
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
