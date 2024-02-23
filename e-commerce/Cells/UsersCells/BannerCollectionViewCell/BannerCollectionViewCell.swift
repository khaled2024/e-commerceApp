//
//  BannerCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/01/2024.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImageView: UIImageView!
    static let identifier = String(describing: BannerCollectionViewCell.self)
    
    static func uiNib()-> UINib{
        return UINib(nibName: BannerCollectionViewCell.identifier, bundle: .main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(with_ banner: BannerModel){
        self.bannerImageView.image = UIImage(named: banner.image)
    }

}
