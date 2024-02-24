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
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.separatorStyle = .none
        setUpDesign()
        setUpDelegate()
        
    }
    func setUpDelegate(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    func setUpDesign(){
        chatBtn.setUpShadow()
        deliverBtn.setUpShadow()
        cartBtn.setUpShadow()
        filterBtn.layer.cornerRadius = 15
        bannerImage.layer.cornerRadius = 20
    }
    
    
}
extension SecondMainViewController: CategoryTableViewCellDelegate{
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
        detailProVC.setUpData(product: product)
        
    }
    
    
}
// UITableViewDelegate
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
            cell.products = bestProducts
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
