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
    var cartProducts: [Product] = [
        Product(name: "Cheese Cake", image: StarbucksImages.chocolateChip!, price: 10.99, description: "Delicious cheese cake with a crumbly crust."),
        Product(name: "Mocha", image: StarbucksImages.latte!, price: 4.99, description: "Rich chocolatey mocha made with espresso and steamed milk.")
    ]
    
    
    lazy var cartTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
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
    
    lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Amount:"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "R0.00"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var payCheckoutButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pay & Checkout", for: .normal)
        button.setTitleColor(StarbucksColors.starbucksTextGray, for: .normal)
        button.backgroundColor = StarbucksColors.starbucksBackgroundGray
        button.layer.cornerRadius = 8.0
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupUI()
        
    }
    
    func setupUI() {
        
        view.addSubview(cartTableView)
        view.addSubview(emptyCartLabel)
        view.addSubview(totalAmountLabel)
        view.addSubview(priceLabel)
        view.addSubview(payCheckoutButton)
        
        emptyCartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyCartLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        totalAmountLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4).isActive = true
        totalAmountLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: payCheckoutButton.topAnchor, constant: -16).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        payCheckoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        payCheckoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        payCheckoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        payCheckoutButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        cartTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func registerCell() {
        cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartTableViewCellID")
           
    }
    
    
}
