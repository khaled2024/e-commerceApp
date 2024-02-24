//
//  CategoryCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/01/2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    static func uiNib()-> UINib{
        return UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(category: CategoryModel){
        self.categoryImageView.image = UIImage(named: category.image)
        self.categoryLabel.text = category.name
    }
}
