//
//  bestProductsCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.
//

import UIKit

class bestProductsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var resturantname: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    
    static let identifier = String(describing: bestProductsCollectionViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: bestProductsCollectionViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpDesign()
    }
    func setUpDesign(){
        productImage.layer.cornerRadius = 10
        productView.layer.cornerRadius = 10
        productView.layer.shadowColor = UIColor.orange.withAlphaComponent(0.5).cgColor
        productView.layer.shadowRadius = 2
        productView.layer.shadowOpacity = 3
        productView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    // config for best products
    func config(product: ProductData){
        if let productPrice = product.price,let imageURL = product.images?.image {
            self.priceLabel.text = "$\(productPrice)"
            self.productImage.loadDataUsingCacheWithUrlString(urlString: imageURL)
            self.productName.text = product.name
            self.resturantname.text = product.marketName
        }
    }
    func config(product: Product){
        self.priceLabel.text = "$\(product.price)"
        self.productImage.image = UIImage(named: product.image)
        self.productName.text = product.productName
        self.resturantname.text = product.resturantName
    }
    func configBurger(product: Product){
        self.priceLabel.text = "$\(product.price)"
        self.productImage.image = UIImage(named: product.image)
        self.productName.text = product.productName
        self.resturantname.text = product.resturantName
    }
    func configPizza(product: Product){
        self.priceLabel.text = "$\(product.price)"
        self.productImage.image = UIImage(named: product.image)
        self.productName.text = product.productName
        self.resturantname.text = product.resturantName
    }

}
