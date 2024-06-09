//
//  ItemViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //    var productName: String = ""
    //    var productPrice: Double = 0.0
    let productHeaderView = ItemContainerView()
    var product: Product
    var selectedSize: ProductSize?
    var selectedIndexPath: IndexPath?
    
    var number: ((Int) -> Void)?
    
    lazy var productTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addToBasketButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        let buttonText = "Add to basket •  " + StarbucksPriceDecimal.currencyFormat(price: product.price)
        button.setTitle(buttonText, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8.0
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = StarbucksColors.primaryColor
        button.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Initializer
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    // Required init for using storyboard or nibs (which is not the case here)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup UI components
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupProductUI()
        registerCell()
        configureHeaderView()
    }
    
    // Setup product UI
    func setupProductUI() {
        title = product.name
        let basketButtonText = "Add to basket " + StarbucksPriceDecimal.currencyFormat(price: product.price)
        addToBasketButton.setTitle(basketButtonText, for: .normal)
        productHeaderView.product = product
    }
    
    
    func setupUI() {
        view.addSubview(productTableView)
        view.addSubview(addToBasketButton)
          
        productTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productTableView.bottomAnchor.constraint(equalTo: addToBasketButton.topAnchor, constant: -20).isActive = true
        productTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        addToBasketButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        addToBasketButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        addToBasketButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addToBasketButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    // Register table view cells
    func registerCell() {
        productTableView.register(ProductDetailsTableViewCell.self, forCellReuseIdentifier: ProductDetailsTableViewCell.cellID)
        productTableView.register(ProductSizeTableCell.self, forCellReuseIdentifier: ProductSizeTableCell.cellID)
        productTableView.register(ProductDisclaimerTableCell.self, forCellReuseIdentifier: ProductDisclaimerTableCell.cellID)
    }
    
    
    // Adjust header size to fit content
    func sizeHeaderToFit() {
        productHeaderView.setNeedsLayout()
        productHeaderView.layoutIfNeeded()
        productHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 318)
    }
    
    // Configure header view
    func configureHeaderView() {
        
        productTableView.tableHeaderView = productHeaderView
        productHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 318)
        productTableView.tableHeaderView = productHeaderView
        sizeHeaderToFit()
    }
    
    // Add product to basket
    @objc func addToBasket() {
        let cartItem = CartModel(
            name: product.name,
            image: UIImage(), // product.image,
            cost: product.price + (selectedSize?.price ?? 0),
            numberOfItems: 1,
            selectedSize: selectedSize // Pass the selected size here
        )
        
        // Append the item to the cartProducts array first
        StarbucksDatabase.cartProducts.append(cartItem)
        
        // show a confirmation to the user
    
        let alert = UIAlertController(title: "Added to Cart", message: "\(product.name) has been added to your cart.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
            self.number?(3)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // Navigate to cart & // Pass the cart products data
    func navigateToCart() {
        let cartViewController = CartViewController()
        cartViewController.cartProductarray = StarbucksDatabase.cartProducts
        navigationController?.pushViewController(cartViewController, animated: true)
    }
    
}

    
    //    @objc func addToBasket() {
    //
    //        let cartItem = CartModel(name: product.name, image: product.image, price: product.price)
    //        StarbucksDatabase.cartProducts.append(cartItem)
    //        print(StarbucksDatabase.cartProducts.count)
    //
    //
    //    }
    //
    




