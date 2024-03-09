//
//  MarketMealsViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 08/03/2024.
//

import UIKit

class MarketMealsViewController: UIViewController {
    // MARK: - Outlets :-
    @IBOutlet weak var marketMealSecondView: UIView!
    @IBOutlet weak var addMealBtn: UIButton!
    @IBOutlet weak var abonnementLabel: UILabel!
    @IBOutlet weak var marketStatusView: UIView!
    @IBOutlet weak var marketStatusLabel: UILabel!
    @IBOutlet weak var marketImage: UIImageView!
    @IBOutlet weak var marketNamLabel: UILabel!
    @IBOutlet weak var marketMealCollectionView: UICollectionView!
    @IBOutlet weak var marketMealsTopView: UIView!
    static let identifier = String(describing: MarketMealsViewController.self)
    let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        setUpTableView()
        
    }
    // MARK: - Functions
    func setDesign(){
        addMealBtn.layer.cornerRadius = 10
        marketMealsTopView.setCorners()
        marketImage.makeCircle()
        marketMealSecondView.setCorners()
        marketStatusView.layer.cornerRadius = marketStatusView.frame.height/2
    }
    func setUpTableView(){
        marketMealCollectionView.delegate = self
        marketMealCollectionView.dataSource = self
        marketMealCollectionView.register(FavouriteCollectionViewCell.uiNib(), forCellWithReuseIdentifier: FavouriteCollectionViewCell.identifier)
        marketMealCollectionView.showsVerticalScrollIndicator = false
        marketMealCollectionView.showsHorizontalScrollIndicator = false
    }
    // MARK: - Actions
    @IBAction func addMealBtnTapped(_ sender: UIButton) {
        print("Add Meal")
        navManager.push(screen: .marketAddMealDashboard, nav: navigationController)
    }
    
}
// MARK: - extension (UICollectionViewDelegate)
extension MarketMealsViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouriteProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.identifier, for: indexPath)as! FavouriteCollectionViewCell
        cell.config(product: favouriteProducts[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Cell Tapped #\(indexPath.row)")
    }
}
