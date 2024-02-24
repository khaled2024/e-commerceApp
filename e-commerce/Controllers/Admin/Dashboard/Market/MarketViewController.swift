//
//  MarketViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import UIKit

class MarketViewController: UIViewController {
    
    @IBOutlet weak var marketCollectionView: UICollectionView!
    @IBOutlet weak var addMarketBtn: UIButton!
    @IBOutlet weak var marketsView: UIView!
    private let navManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Market"
        setUpDesign()
        setUpCell()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func setUpCell(){
        marketCollectionView.delegate = self
        marketCollectionView.dataSource = self
        marketCollectionView.register(MarketCollectionViewCell.uiNib(), forCellWithReuseIdentifier: MarketCollectionViewCell.identifier)
    }
    func setUpDesign(){
        addMarketBtn.layer.cornerRadius = 10
    }
    
    @IBAction func dismissBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// UICollectionViewDelegate, UICollectionViewDataSource
extension MarketViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return markets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketCollectionViewCell.identifier, for: indexPath)as! MarketCollectionViewCell
        cell.config(market: markets[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: marketCollectionView.frame.width/2, height: 500)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let marketDetailVC = navManager.instantiate(screen: .marketDetail)as! MarketDetailsViewController
        navigationController?.pushViewController(marketDetailVC, animated: true)
        marketDetailVC.market = markets[indexPath.row]
    }
    
    
}
