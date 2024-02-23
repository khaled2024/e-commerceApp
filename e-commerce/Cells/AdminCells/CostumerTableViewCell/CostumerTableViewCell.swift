//
//  CostumerTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class CostumerTableViewCell: UITableViewCell {
    @IBOutlet weak var costumerView: UIView!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var costumerImage: UIImageView!
    static let identifier = String(describing: CostumerTableViewCell.self)
    
    static func uiNib()-> UINib{
        return UINib(nibName: CostumerTableViewCell.identifier, bundle: .main)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        costumerView.layer.cornerRadius = 15
        costumerImage.layer.cornerRadius = 30
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func config(with costumer:CostumerModel){
        self.costumerImage.image = UIImage(named: costumer.costumerImage)
        self.message.text = costumer.message
        self.customerName.text = costumer.name
        self.timeLable.text = costumer.time
    }
}
