//
//  SecondMainViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 21/02/2024.
//

import UIKit


class SecondMainViewController: UIViewController {
    @IBOutlet weak var deliverBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    var footerView: UIView{
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }
    var allProducts: [ProductData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.separatorStyle = .none
        setUpDesign()
        setUpDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllBestProducts()
        getUserProfile()
    }
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
    func setUpDelegate(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    func setUpDesign(){
        chatBtn.setUpShadow(color: .systemYellow)
        deliverBtn.setUpShadow(color: .systemYellow)
        cartBtn.setUpShadow(color: .systemYellow)
        filterBtn.layer.cornerRadius = 15
        bannerImage.layer.cornerRadius = 20
    }
    
    
}
// MARK: - CategoryTableViewCellDelegate
extension SecondMainViewController: CategoryTableViewCellDelegate{
    // for all product
    func showProductDetail(cell: CategoryTableViewCell, product: ProductData) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailProVC = storyboard.instantiateViewController(withIdentifier: ProductDetailViewController.identifier) as! ProductDetailViewController
        self.present(detailProVC, animated: true)
        detailProVC.setUpData(product: product)
        detailProVC.product = product
    }
    func showResturantDetail(cell: CategoryTableViewCell, resturant: RestaurantModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailResVC = storyboard.instantiateViewController(withIdentifier: ResturantDetailViewController.identifier) as! ResturantDetailViewController
        self.present(detailResVC, animated: true)
        detailResVC.setUpData(resturant: resturant)
    }
    
    func showProductDetail(cell: CategoryTableViewCell, product: Product) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailProVC = storyboard.instantiateViewController(withIdentifier: ProductDetailViewController.identifier) as! ProductDetailViewController
        self.present(detailProVC, animated: true)
        detailProVC.setUpDataForBurger(product: product)
        
    }
    
    
}
// MARK: -  UITableViewDelegate
extension SecondMainViewController: UITableViewDelegate,UITableViewDataSource{
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
            cell.delegate = self
            cell.resturants = restaurants
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath)as! CategoryTableViewCell
            cell.headerLabel.text = "Best Products"
            cell.showAllBtn.isHidden = false
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
            cell.delegate = self
            cell.burgerProducts = bestBurgers
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
