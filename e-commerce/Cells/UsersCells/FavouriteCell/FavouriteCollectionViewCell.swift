//
//  FavouriteCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var favouriteView: UIView!
    
    static let identifier = String(describing: FavouriteCollectionViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: FavouriteCollectionViewCell.identifier, bundle: nil)
    }
    func config(product: Favourite){
        self.favouriteImage.image = product.image
        self.availableLabel.text = product.available.rawValue
        self.productName.text = product.productName
        if product.available == .Exist{
            self.availableLabel.textColor = .systemGreen
        }else{
            self.availableLabel.textColor = .systemRed
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        favouriteView.setUpLayerForCell()
        favouriteImage.layer.cornerRadius = 10
    }
}
