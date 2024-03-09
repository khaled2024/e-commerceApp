//
//  MarketAnnouncementTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 09/03/2024.
//

import UIKit

class MarketAnnouncementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var announcementDatePublished: UILabel!
    @IBOutlet weak var announcementTitleLabel: UILabel!
    @IBOutlet weak var CellContentView: UIView!
    @IBOutlet weak var announcementImage: UIImageView!
    
    static let identifier = String(describing: MarketAnnouncementTableViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: MarketAnnouncementTableViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CellContentView.setUpLayerForCell()
        announcementImage.setCorners(corner: 10)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
