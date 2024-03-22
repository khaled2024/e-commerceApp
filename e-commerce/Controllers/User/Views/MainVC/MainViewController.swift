//
//  ViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/01/2024.

import UIKit

class MainViewController: UIViewController {
    // MARK: - Outlets and Variables :-
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageController: UIPageControl!
    // MARK: - Variables
    var footerView: UIView{
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }
    var timer: Timer?
    var currentCellIndex = 0
    
    var allProducts: [ProductData] = []
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
        setUpDesign()
        registerCells()
        startTimer()
        bannerPageController.numberOfPages = bannerImages.count
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserProfile()
        getAllBestProducts()
    }
    // MARK: - Functions
    // MARK: - API Functions
    func loadToken()-> String?{
        if let loadedToken = Keychain.load(key: Constants.KeyChain.token.rawValue),let loadedTokenString = String(data: loadedToken, encoding: .utf8){
            return loadedTokenString
        }
        return nil
    }
    func getUserProfile(){
        guard let loadedToken = loadToken() else{return}
        APIService.shared.fetchDataWithToken(url: Constants.TheUrl + Endpoint.Path.profile.rawValue, token: loadedToken) { (profileData: LoginData?, error) in
            guard let profileData = profileData else{return}
            print(profileData)
        }
    }
    /// Fetch API Functions :-
    func getAllBestProducts(){
        APIService.shared.fetchData(url: Constants.TheUrl + Endpoint.Path.allProduct.rawValue) { [weak self] (allProducts: UserProductModel?,error) in
            if let allProducts = allProducts?.data{
                print("All Products :- \n \(allProducts)")
                self?.allProducts = allProducts
            }
        }
    }
    // MARK: - Design Functions
    func setUpDelegate(){
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    func setUpDesign(){
        self.view.backgroundColor = .white
        searchBtn.layer.cornerRadius = 20
        menuBtn.layer.cornerRadius = 20
        mainTableView.separatorStyle = .none
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.showsHorizontalScrollIndicator = false
    }
    func registerCells(){
        bannerCollectionView.register(BannerCollectionViewCell.uiNib(), forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
    }
    func startTimer(){
        currentCellIndex = bannerPageController.currentPage
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    @objc func moveToNextIndex(){
        if currentCellIndex < bannerImages.count - 1{
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        bannerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        bannerPageController.currentPage = currentCellIndex
    }
    // MARK: - Actions
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        print("Search Tapped :-")
        let storyBoard = UIStoryboard(name: "Main", bundle: .none)
        let searchVC = storyBoard.instantiateViewController(withIdentifier: SearchViewController.identifier)as! SearchViewController
        self.present(searchVC, animated: true)
    }
}
// MARK: - (CategoryTableViewCellDelegate)
extension MainViewController: CategoryTableViewCellDelegate{
    // for all product
    func showProductDetail(cell: CategoryTableViewCell, product: ProductData) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailProVC = storyboard.instantiateViewController(withIdentifier: ProductDetailViewController.identifier) as! ProductDetailViewController
        self.present(detailProVC, animated: true)
        detailProVC.setUpData(product: product)
        detailProVC.product = product
    }
    // for resturant
    func showResturantDetail(cell: CategoryTableViewCell, resturant: RestaurantModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailResVC = storyboard.instantiateViewController(withIdentifier: ResturantDetailViewController.identifier) as! ResturantDetailViewController
        self.present(detailResVC, animated: true)
        detailResVC.setUpData(resturant: resturant)
    }
    // for burger product
    func showProductDetail(cell: CategoryTableViewCell, product: Product) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailProVC = storyboard.instantiateViewController(withIdentifier: ProductDetailViewController.identifier) as! ProductDetailViewController
        self.present(detailProVC, animated: true)
        detailProVC.setUpDataForBurger(product: product)
        
    }
}
// MARK: - (UITableViewDelegate)
extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Categories"
            cell.showAllBtn.isHidden = true
            cell.categories = categories
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Resturants"
            cell.showAllBtn.isHidden = false
            cell.resturants = restaurants
            cell.delegate = self
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Best Products"
            cell.showAllBtn.isHidden = false
            // TODO:- here for tapped on item delegate it from the cell
            cell.delegate = self
            cell.allProducts = allProducts
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Best Restaurants"
            cell.showAllBtn.isHidden = false
            cell.bestResturants = bestResturants
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Burger Product"
            cell.showAllBtn.isHidden = false
            cell.burgerProducts = bestBurgers
            cell.delegate = self
            return cell
        }else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Pizza Products"
            cell.showAllBtn.isHidden = false
            cell.pizzaProducts = bestPizza
            return cell
        }else{
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 130
        }else if indexPath.section == 1{
            return 600
        }else{
            return 200
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1{
            return footerView
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1{
            return 150
        }
        return 0
    }
}
// MARK: - Extensions (UICollectionViewDelegate)
extension MainViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannerImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as! BannerCollectionViewCell
        cell.config(with_: bannerImages[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}