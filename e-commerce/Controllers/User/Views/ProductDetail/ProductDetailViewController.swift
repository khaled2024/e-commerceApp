//
//  ProductDetailViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: -  outlets & Vars
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var smallBtn: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var quantityView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var mediumBtn: UIButton!
    @IBOutlet weak var finishingPriceView: UIView!
    @IBOutlet weak var largeBtn: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gotocartBtn: UIButton!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var productView: UIView!
    static let identifier = String(describing: ProductDetailViewController.self)
    var quantity: Int = 0
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        quantityLabel.text = "\(quantity)"
        registerCell()
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
    }
    // MARK: -  functions
    // for burger product
    func setUpDataForBurger(product: Product){
        self.productImage.image = UIImage(named: product.image)
        self.priceLabel.text = "$\(product.price)"
    }
    // for all product detail
    func setUpData(product: ProductData){
        self.productImage.loadDataUsingCacheWithUrlString(urlString: product.images.image)
        self.priceLabel.text = "$\(product.price)"
        self.descriptionLabel.text = product.description
    }
    func registerCell(){
        ingredientTableView.register(IngredientsTableViewCell.uiNib(), forCellReuseIdentifier: IngredientsTableViewCell.identifier)
    }
    private func setUpDesign(){
        heartBtn.layer.cornerRadius = 10
        backBtn.layer.cornerRadius = 10
        priceView.layer.cornerRadius = 20
        quantityView.layer.cornerRadius = 20
        gotocartBtn.roundCorners(corners: [.bottomLeft,.bottomRight,.topRight], radius: 15)
        smallBtn.setUpLayer(size: 12, borderColor: UIColor.systemOrange.cgColor, borderWidth: 1)
        mediumBtn.setUpLayer(size: 12, borderColor: UIColor.systemOrange.cgColor, borderWidth: 1)
        largeBtn.setUpLayer(size: 12, borderColor: UIColor.systemOrange.cgColor, borderWidth: 1)
        finishingPriceView.setUpLayers()
        ingredientTableView.showsVerticalScrollIndicator = false
        ingredientTableView.separatorStyle = .none
    }
    // MARK: -  IBActions
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        quantity += 1
        quantityLabel.text = "\(quantity)"
    }
    @IBAction func minusBtnTapped(_ sender: UIButton) {
        if quantity == 0 {
            print("Cant order 0 quantity of the Product ")
        }else{
            quantity -= 1
        }
        quantityLabel.text = "\(quantity)"
    }
    
    @IBAction func gotocartBtnTapped(_ sender: UIButton) {
        print("\(sender.titleLabel?.text ?? "")")
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    @IBAction func heartBtnTapped(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: "heart"){
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.imageView?.tintColor = .red
        }else{
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    @IBAction func largeBtnTapped(_ sender: UIButton) {
        if sender.backgroundColor == .white{
            print("tapped \(sender.titleLabel?.text ?? "")")
            largeBtn.tintColor = .white
            largeBtn.backgroundColor = .systemOrange
        }else{
            largeBtn.tintColor = .systemOrange
            largeBtn.layer.cornerRadius = 12
            largeBtn.layer.borderColor = UIColor.systemOrange.cgColor
            largeBtn.layer.borderWidth = 1
            largeBtn.backgroundColor = .white
        }
    }
    @IBAction func smallBtnTapped(_ sender: UIButton) {
        if sender.backgroundColor == .white{
            print("tapped \(sender.titleLabel?.text ?? "")")
            sender.tintColor = .white
            sender.backgroundColor = .systemOrange
        }else{
            sender.tintColor = .systemOrange
            sender.layer.cornerRadius = 12
            sender.layer.borderColor = UIColor.systemOrange.cgColor
            sender.layer.borderWidth = 1
            sender.backgroundColor = .white
        }
    }
    @IBAction func mediumBtnTapped(_ sender: UIButton) {
        if sender.backgroundColor == .white{
            print("tapped \(sender.titleLabel?.text ?? "")")
            sender.tintColor = .white
            sender.backgroundColor = .systemOrange
        }else{
            sender.tintColor = .systemOrange
            sender.layer.cornerRadius = 12
            sender.layer.borderColor = UIColor.systemOrange.cgColor
            sender.layer.borderWidth = 1
            sender.backgroundColor = .white
        }
    }
}
// MARK: -  extensions
extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.identifier, for: indexPath)as! IngredientsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
