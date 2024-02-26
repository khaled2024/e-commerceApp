//
//  DriverCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/02/2024.
//

import UIKit

class DriverCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var driverLicense: UILabel!
    
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
        
    }
    func config(driver: DriverModel){
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

}
