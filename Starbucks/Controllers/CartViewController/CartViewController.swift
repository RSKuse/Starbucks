//
//  CartViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // Dummy array of products in the cart
    var cartProducts: [CartModel] = [CartModel(name: "Chocolate Chip®", image: StarbucksImages.chocolateChip!, price: 52.00, size: [ProductSize(name: "Large", price: 35.89)])]
    
    lazy var amountContainer: TotalAmountContainerView = {
        let view = TotalAmountContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cartTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        tableView.allowsSelection = true
        tableView.backgroundColor = StarbucksColors.starbucksBackgroundGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var emptyCartLabel: UILabel = {
        let label = UILabel()
        label.text = "Your cart will be shown here. \nGet started by adding items"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = StarbucksColors.starbucksBackgroundGray
        title = "Cart"
        setupNavigationBar()
        setupUI()
        registerCell()
        
    }
    
    func setupUI() {
        
        view.addSubview(cartTableView)
        view.addSubview(emptyCartLabel)
        view.addSubview(amountContainer)
        
        emptyCartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyCartLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cartTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        amountContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        amountContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        amountContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        amountContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func registerCell() {
        cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartTableViewCellID")
           
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
         
    }
    
    
}
