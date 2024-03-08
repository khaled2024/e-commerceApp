//
//  MarketOrderTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 08/03/2024.
//

import UIKit

class MarketOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var driverIdLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    static let identifier = String(describing: MarketOrderTableViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: MarketOrderTableViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(with model: MarketOrderModel){
        self.idLabel.text = model.id
        self.nameLabel.text = model.name
        self.payLabel.text = model.pay.rawValue
        self.driverIdLabel.text = String(model.driverID)
        self.dateLabel.text = model.date
        self.timeLabel.text = model.time
        self.mealLabel.text = model.meals
    }
    func defaultConfig(){
        self.cellView.backgroundColor = .systemGray
        self.idLabel.text = "Id"
        self.nameLabel.text = "Name"
        self.payLabel.text = "Pay"
        self.driverIdLabel.text = "Driver id"
        self.dateLabel.text = "Date"
        self.timeLabel.text = "Time"
        self.mealLabel.text = "Meals"

    }
    
}
