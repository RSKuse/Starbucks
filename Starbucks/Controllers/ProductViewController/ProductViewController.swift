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
        button.isEnabled = false
        button.setTitle("Add to basket • R\(product.price)", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8.0
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = StarbucksColors.primaryColor
        button.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupProductUI()
        registerCell()
        configureHeaderView()
    }
    
    func setupProductUI() {
        title = product.name
        addToBasketButton.setTitle("Add to basket • R\(product.price)", for: .normal)
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
    
    func registerCell() {
        productTableView.register(ProductDetailsTableViewCell.self, forCellReuseIdentifier: ProductDetailsTableViewCell.cellID)
        productTableView.register(ProductSizeTableCell.self, forCellReuseIdentifier: ProductSizeTableCell.cellID)
        productTableView.register(ProductDisclaimerTableCell.self, forCellReuseIdentifier: ProductDisclaimerTableCell.cellID)
    }
    
    func sizeHeaderToFit() {
        productHeaderView.setNeedsLayout()
        productHeaderView.layoutIfNeeded()
        productHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 318)
    }

    func configureHeaderView() {
        productHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 318)
        productTableView.tableHeaderView = productHeaderView
    }
    
    @objc func addToBasket() {
        // Add product to cart
        let cartViewController = CartViewController()
        cartViewController.cartProducts.append(product)
        navigationController?.pushViewController(cartViewController, animated: true)
    }
 

}



