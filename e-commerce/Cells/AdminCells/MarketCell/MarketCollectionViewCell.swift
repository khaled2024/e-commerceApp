//
//  MarketCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var calenderImage: UIImageView!
    @IBOutlet weak var marketExpireDate: UILabel!
    @IBOutlet weak var marketCategory: UILabel!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var marketImage: UIImageView!
    @IBOutlet weak var marketView: UIView!
    
    static let identifier = String(describing: MarketCollectionViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: MarketCollectionViewCell.identifier, bundle: nil)
    }
    func config(market: MarketModel){
        self.marketImage.image = market.image
        self.marketExpireDate.text = market.available.rawValue
        self.marketName.text = market.marketName
        self.marketCategory.text = market.marketCategory
        if market.available == .Expired{
            self.marketExpireDate.textColor = .systemRed
        }else{
            self.marketExpireDate.textColor = .darkGray
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        marketView.setUpLayerForCell()
        marketImage.layer.cornerRadius = 10
    }
}
