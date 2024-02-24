//
//  SearchViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 27/01/2024.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var resturantsCollectionView: UICollectionView!
    @IBOutlet weak var categoryProductCollectionView: UICollectionView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var searchbar: UISearchBar!
    static let identifier = String(describing: SearchViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configDesign()
        configSearchbar()
        
    }
    func configSearchbar(){
        searchbar.delegate = self
    }
    func registerCells(){
        categoryProductCollectionView.delegate = self
        categoryProductCollectionView.dataSource = self
        resturantsCollectionView.delegate = self
        resturantsCollectionView.dataSource = self
        categoryProductCollectionView.register(CategoryCollectionViewCell.uiNib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        resturantsCollectionView.register(RestaurantsCollectionViewCell.uiNib(), forCellWithReuseIdentifier: RestaurantsCollectionViewCell.identifier)
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    func configDesign(){
        filterBtn.layer.cornerRadius = 10
    }
}
// searchBar
extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
// UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryProductCollectionView{
            return categories.count
        }else{
            return bestResturants.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryProductCollectionView{
            let cell = categoryProductCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)as! CategoryCollectionViewCell
            cell.config(category: categories[indexPath.row])
            return cell
        }else{
            let cell = resturantsCollectionView.dequeueReusableCell(withReuseIdentifier: RestaurantsCollectionViewCell.identifier, for: indexPath)as! RestaurantsCollectionViewCell
            cell.configResturant(resturant: bestResturants[indexPath.row])
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryProductCollectionView{
            return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.height)
        }else{
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height/3)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
