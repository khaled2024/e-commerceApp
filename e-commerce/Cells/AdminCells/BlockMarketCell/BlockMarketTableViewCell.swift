//
//  BlockMarketTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class BlockMarketTableViewCell: UITableViewCell {
    @IBOutlet weak var renewBtn: UIButton!
    @IBOutlet weak var marketFoodCategry: UILabel!
    @IBOutlet weak var blockMarketName: UILabel!
    @IBOutlet weak var blockMarketImage: UIImageView!
    @IBOutlet weak var blockView: UIView!
    static let identifier = "BlockMarketTableViewCell"
    static func uiNib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpDesign()
    }
    func setUpDesign(){
        blockView.setUpLayerForCell()
        blockMarketImage.makeCircle()
        renewBtn.setCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
