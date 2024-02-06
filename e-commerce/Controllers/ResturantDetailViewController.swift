//
//  ResturantDetailViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/01/2024.
//

import UIKit

class ResturantDetailViewController: UIViewController {
    @IBOutlet weak var resturantDetailView: UIView!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var foodCategoryLabel: UILabel!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var resturantName: UILabel!
    
    static let identifier = String(describing: ResturantDetailViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(bestProductsCollectionViewCell.uiNib(), forCellWithReuseIdentifier: bestProductsCollectionViewCell.identifier)
    }
    func setUpData(resturant: RestaurantModel){
        self.resturantImage.image = UIImage(named: resturant.image)
        self.resturantName.text = resturant.name
        self.stateLabel.text = resturant.state.rawValue
        if resturant.state == .open {
            self.stateView.backgroundColor = .systemGreen
        }else{
            self.stateView.backgroundColor = .systemRed
        }
    }
    func setUpDesign(){
        bookmarkBtn.layer.cornerRadius = 10
        backBtn.layer.cornerRadius = 10
        resturantDetailView.layer.cornerRadius = 10
        resturantDetailView.layer.shadowColor = UIColor.orange.withAlphaComponent(0.5).cgColor
        resturantDetailView.layer.shadowRadius = 10
        resturantDetailView.layer.shadowOpacity = 4
        resturantImage.layer.cornerRadius = 15
        
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
extension ResturantDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bestProductsCollectionViewCell.identifier, for: indexPath)as! bestProductsCollectionViewCell
        cell.config(product: bestProducts[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 , height: 180)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
