//
//  MarketDriversViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 08/03/2024.
//

import UIKit

class MarketDriversViewController: UIViewController {
    // MARK: - Vars and Outlets
    @IBOutlet weak var driversStatusSegmentController: UISegmentedControl!
    @IBOutlet weak var marketDriversCollectionView: UICollectionView!
    static let identifier = String(describing: MarketDriversViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        marketDriversCollectionView.delegate = self
        marketDriversCollectionView.dataSource = self
        marketDriversCollectionView.showsVerticalScrollIndicator = false
        marketDriversCollectionView.showsHorizontalScrollIndicator = false
        driversStatusSegmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal) // Change UIColor.red to your desired color
        driversStatusSegmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected) // Change UIColor.blue to your desired color
        driversStatusSegmentController.layer.cornerRadius = 20
        marketDriversCollectionView.register(DriverCollectionViewCell.uiNib(), forCellWithReuseIdentifier: DriverCollectionViewCell.identifier)
    }
    
    // MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - Extensions
extension MarketDriversViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allDrivers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DriverCollectionViewCell.identifier, for: indexPath)as! DriverCollectionViewCell
        cell.configForMarket(driver: allDrivers[indexPath.row])
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
