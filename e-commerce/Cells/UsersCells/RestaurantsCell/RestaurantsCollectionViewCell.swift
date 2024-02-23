//
//  RestaurantsCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/01/2024.
//

import UIKit

class RestaurantsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var resturantView: UIView!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var resturantState: UILabel!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var orderNowBtn: UIButton!
    @IBOutlet weak var resturantImage: UIImageView!
    
    static let identifier = String(describing: RestaurantsCollectionViewCell.self)
    static func uiNib()-> UINib{
        return UINib(nibName: RestaurantsCollectionViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpDesign()
    }
    func setUpDesign(){
        orderNowBtn.layer.cornerRadius = 5
        resturantImage.layer.cornerRadius = 10
        resturantView.layer.cornerRadius = 10
        resturantView.layer.shadowColor = UIColor.orange.withAlphaComponent(0.5).cgColor
        resturantView.layer.shadowRadius = 2
        resturantView.layer.shadowOpacity = 3
        resturantView.layer.shadowOffset = CGSize(width: 1, height: 1)
        stateView.layer.cornerRadius = 2.5
    }
    // for all resturants
    func config(resturant: RestaurantModel){
        self.resturantImage.image = UIImage(named: resturant.image)
        self.resturantState.text = resturant.state.rawValue
        self.resturantName.text = resturant.name
        if resturant.state == .open{
            stateView.backgroundColor = .systemGreen
        }else{
            stateView.backgroundColor = .systemRed
        }
    }
    // for best resturants
    func configResturant(resturant: RestaurantModel){
        self.resturantImage.image = UIImage(named: resturant.image)
        self.resturantState.text = resturant.state.rawValue
        self.resturantName.text = resturant.name
        if resturant.state == .open{
            stateView.backgroundColor = .systemGreen
        }else{
            stateView.backgroundColor = .systemRed
        }
    }
    @IBAction func heartBtnTapped(_ sender: UIButton) {
        print("favorite Tapped")
        if sender.imageView?.image == UIImage(named: "heart.fill"){
            sender.setImage(UIImage(named: "heart"), for: .normal)
        }else{
            sender.setImage(UIImage(named: "heart.fill"), for: .normal)
        }
        
    }
    
}
