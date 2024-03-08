//
//  DriverCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/02/2024.
//

import UIKit

class DriverCollectionViewCell: UICollectionViewCell {
    // for market drivers
    @IBOutlet weak var marketDriversStatusView: UIView!
    @IBOutlet weak var marketDriversLabel: UILabel!
    @IBOutlet weak var viewForDriverMarkets: UIView!
    // for admin drivers
    @IBOutlet weak var driverLicense: UILabel!
    @IBOutlet weak var expireImage: UIImageView!
    
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverView: UIView!
    static let identifier = String(describing: DriverCollectionViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: DriverCollectionViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        driverView.setUpLayerForCell()
        driverImage.makeCircle()
        marketDriversStatusView.layer.cornerRadius = marketDriversStatusView.frame.height/2
        
    }
    func configForAdmin(driver: DriverModel){
        self.viewForDriverMarkets.isHidden = true
        self.driverImage.image = driver.driverImage
        self.driverName.text = driver.driverName
        if driver.driverLicense == .Expired{
            self.driverLicense.textColor = .red
            self.driverLicense.text = driver.driverLicense.rawValue
        }else{
            self.driverLicense.textColor = .darkGray
            self.driverLicense.text = driver.driverLicense.rawValue
        }
    }
    func configForMarket(driver: DriverModel){
        self.driverImage.image = driver.driverImage
        self.driverName.text = driver.driverName
        self.driverLicense.isHidden = true
        self.expireImage.isHidden = true
        self.marketDriversLabel.text = driver.marketDriverStatus.rawValue
        if driver.marketDriverStatus == .Offline{
            self.marketDriversStatusView.backgroundColor = .systemRed
            self.marketDriversLabel.textColor = .systemRed
        }else{
            self.marketDriversStatusView.backgroundColor = .systemGreen
            self.marketDriversLabel.textColor = .systemGreen
        }
    }

}
