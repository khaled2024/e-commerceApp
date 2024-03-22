//
//  FavouriteViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class FavouriteViewController: UIViewController{
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    var userFavouriteProducts: [ProductData] = []
    let refreshControl = UIRefreshControl()
    let storageManager = StorageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.register(FavouriteCollectionViewCell.uiNib(), forCellWithReuseIdentifier: FavouriteCollectionViewCell.identifier)
        refreshControlSetUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkingUserLogging()
    }
    // MARK: - Functions
    func loadToken()-> String?{
        if let loadedToken = Keychain.load(key: Constants.KeyChain.token.rawValue),let loadedTokenString = String(data: loadedToken, encoding: .utf8){
            return loadedTokenString
        }
        return nil
    }
    func checkingUserLogging(){
        if storageManager.isUserLogging(){
            getAllFavouriteProduct()
            self.refreshControl.endRefreshing()
        }else{
            self.userFavouriteProducts = []
            DispatchQueue.main.async {
                self.favouriteCollectionView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    func getAllFavouriteProduct(){
        guard let loadedToken = loadToken() else{return}
        print(loadedToken)
        APIService.shared.fetchDataWithToken(url: Constants.TheUrl + Endpoint.Path.allFavourie.rawValue, token: loadedToken) { [weak self] (favouriteData: UserProductModel?, error) in
            if let error = error {print(error.localizedDescription)}
            if let favouriteData = favouriteData {
                self?.userFavouriteProducts = favouriteData.data
                DispatchQueue.main.async {
                    self?.favouriteCollectionView.reloadData()
                }
            }
        }
    }
    func refreshControlSetUp(){
        self.refreshControl.addTarget(self, action: #selector(refreshTapped), for: .valueChanged)
        favouriteCollectionView.refreshControl = refreshControl
    }
    @objc func refreshTapped(){
        checkingUserLogging()
    }
}
// MARK: - Extension
extension FavouriteViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userFavouriteProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.identifier, for: indexPath)as! FavouriteCollectionViewCell
        cell.config(product: userFavouriteProducts[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(self.userFavouriteProducts[indexPath.row].name)
    }
}
