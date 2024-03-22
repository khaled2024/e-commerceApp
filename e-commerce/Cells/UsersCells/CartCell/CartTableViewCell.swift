//
//  CartTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func plusTapped(cell: CartTableViewCell,sender: UIButton,quantity: String,cartID: String)
    func minusTapped(cell: CartTableViewCell,sender: UIButton,quantity: String,cartID: String)
}
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
    weak var delegate: CartTableViewCellDelegate?
    var cartData: UserCartData?
    // MARK: - LifeCycle
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
    func setUpCartItem(cartItem: CartProduct){
        if let cartData = self.cartData{
            let cartItem = cartData.product
            self.itemImage.loadDataUsingCacheWithUrlString(urlString: cartItem.image.image)
            self.nameObject.text = cartItem.name
            self.numberLabel.text = String(cartItem.quantity)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        guard let quantity = self.numberLabel.text,let cartData = self.cartData else{return}
        guard let quantityInt = Int(quantity)else{return}
        let finalQuantity = quantityInt + 1
        self.numberLabel.text = String(finalQuantity)
        delegate?.plusTapped(cell: self, sender: sender, quantity: String(finalQuantity), cartID: String(cartData.cartID))
        print("DEBUG PRINT: \(finalQuantity)")
    }
    @IBAction func minusBtnTapped(_ sender: UIButton) {
        guard let quantity = self.numberLabel.text,let cartData = self.cartData else{return}
        guard let quantityInt = Int(quantity)else{return}
        let finalQuantity = quantityInt - 1
        self.numberLabel.text = String(finalQuantity)
        delegate?.minusTapped(cell: self, sender: sender, quantity: String(finalQuantity), cartID: String(cartData.cartID))
        print("DEBUG PRINT: \(finalQuantity)")
    }
    
}
