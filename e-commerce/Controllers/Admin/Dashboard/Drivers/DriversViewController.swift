//
//  DriversViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit

class DriversViewController: UIViewController {

    @IBOutlet weak var driversCollectionView: UICollectionView!
    @IBOutlet weak var driverTopNavView: TopNavView!
    
    @IBOutlet weak var addDriverBtn: UIButton!
    static let identifier = String(describing: DriversViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        driversCollectionView.delegate = self
        driversCollectionView.dataSource = self
        
        // register cell
        driversCollectionView.register(DriverCollectionViewCell.uiNib(), forCellWithReuseIdentifier: DriverCollectionViewCell.identifier)
        
        addDriverBtn.layer.cornerRadius = 10
    }
    @IBAction func addDriverBtnTapped(_ sender: UIButton) {
        print("Add driver")
    }
    
    @IBAction func dismissBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension DriversViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allDrivers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DriverCollectionViewCell.identifier, for: indexPath)as! DriverCollectionViewCell
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        cell.config(driver: allDrivers[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.1, height: 220)
    }
}
