//
//  CategoryTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/01/2024.
//

import UIKit

protocol CategoryTableViewCellDelegate: AnyObject {
    func showResturantDetail(cell: CategoryTableViewCell,resturant: RestaurantModel)
    func showProductDetail(cell: CategoryTableViewCell,product: Product)
}

class CategoryTableViewCell: UITableViewCell{
    
    var delegate: CategoryTableViewCellDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showAllBtn: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var categories = [CategoryModel]()
    var resturants = [RestaurantModel]()
    var products = [Product]()
    
    var bestResturants = [RestaurantModel]()
    var burgerProducts = [Product]()
    var pizzaProducts = [Product]()
    
    static let identifier = String(describing: CategoryTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CategoryCollectionViewCell.uiNib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(RestaurantsCollectionViewCell.uiNib(), forCellWithReuseIdentifier: RestaurantsCollectionViewCell.identifier)
        collectionView.register(bestProductsCollectionViewCell.uiNib(), forCellWithReuseIdentifier: bestProductsCollectionViewCell.identifier)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
// UICollectionViewDelegate,UICollectionViewDataSource
extension CategoryTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return categories.count
        }else if section == 1{
            return resturants.count
        }else if section == 2{
            return products.count
        }else if section == 3{
            return bestResturants.count
        }else if section == 4{
            return burgerProducts.count
        }else if section == 5{
            return pizzaProducts.count
        }else{
            return 0
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)as! CategoryCollectionViewCell
            cell.config(category: categories[indexPath.row])
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantsCollectionViewCell.identifier, for: indexPath)as! RestaurantsCollectionViewCell
            cell.config(resturant: resturants[indexPath.row])
            collectionView.collectionViewLayout = UICollectionViewFlowLayout()
            return cell
        }else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bestProductsCollectionViewCell.identifier, for: indexPath)as! bestProductsCollectionViewCell
            cell.config(product: products[indexPath.row])
            return cell
        }
        else if indexPath.section == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantsCollectionViewCell.identifier, for: indexPath)as! RestaurantsCollectionViewCell
            cell.configResturant(resturant: bestResturants[indexPath.row])
            return cell
        }
        else if indexPath.section == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bestProductsCollectionViewCell.identifier, for: indexPath)as! bestProductsCollectionViewCell
            cell.configBurger(product: bestBurgers[indexPath.row])
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
            let resturant = resturants[indexPath.row]
            delegate?.showResturantDetail(cell: self, resturant: resturant)
            print(resturant.name,resturant.state,resturant.image.utf8)
        }
        if indexPath.section == 4{
            let product = burgerProducts[indexPath.row]
            delegate?.showProductDetail(cell: self, product: product)
            print(product.productName,product.resturantName,product.price,product.image.utf8)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.height)
        }else if indexPath.section == 1{
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height/3.2)
            // return CGSize(width: collectionView.frame.width/3.2, height: 150)
        }
        else if indexPath.section == 2{
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
        }
        else{
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
