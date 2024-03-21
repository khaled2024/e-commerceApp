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
    // for test marketMeal wait until came to this VC
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
    func config(product: ProductData){
        self.availableLabel.text = product.status
        self.productName.text = product.name
        guard let imageUrl = product.images?.image else{return}
        self.favouriteImage.loadDataUsingCacheWithUrlString(urlString: imageUrl)
        if product.status == "available"{
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
