//
//  MoreTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 05/03/2024.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var morelable: UILabel!
    @IBOutlet weak var moreimage: UIImageView!
    @IBOutlet weak var moreView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.badgeView.layer.cornerRadius = self.badgeView.frame.height/2
        moreView.setCorners()
    }
    func config(with model: MoreModel){
        self.badgeLabel.text = String(model.bagdeNumber)
        self.moreimage.image = UIImage(systemName: model.image)
        self.morelable.text = model.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
