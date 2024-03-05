//
//  SubscriptionsTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class SubscriptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var marketExpireDate: UILabel!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var marketImage: UIImageView!
    @IBOutlet weak var subContentView: UIView!
    static let identifier = "SubscriptionsTableViewCell"
    static func uiNib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpDesign()
        
    }
    func setUpDesign(){
        self.subContentView.setUpLayerForCell()
        self.marketImage.makeCircle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
