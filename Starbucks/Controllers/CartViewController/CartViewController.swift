//
//  CartViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cartProductArray: [CartModel] = StarbucksDatabase.cartProducts
    var cartProductarray: [CartModel] = []
    let starbucksDatabase = StarbucksDatabase()
    var sizeNameString = ""
    var priceSizeString = ""
    
    
    lazy var amountContainer: TotalAmountContainerView = {
        let view = TotalAmountContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        label.isHidden = true
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
        updateCartView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload the table view each time the view appears
        cartTableView.reloadData()
        updateCartView()
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
        cartTableView.bottomAnchor.constraint(equalTo: amountContainer.topAnchor).isActive = true
        
        amountContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        amountContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        amountContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        amountContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func registerCell() {
        cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.cellID)
        
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        
    }
    
    func updateCartView() {
        if StarbucksDatabase.cartProducts.isEmpty {
            cartTableView.isHidden = true
            emptyCartLabel.isHidden = false
            amountContainer.payCheckoutButton.isEnabled = false
        } else {
            cartTableView.isHidden = false
            emptyCartLabel.isHidden = true
            cartTableView.reloadData()
            updateTotalAmount()
            amountContainer.payCheckoutButton.isEnabled = true
            amountContainer.payCheckoutButton.backgroundColor = StarbucksColors.primaryColor
            amountContainer.payCheckoutButton.setTitleColor(.white, for: .normal)
        }
    }
    
    func updateTotalAmount() {
        var totalAmount = 0.0
        for product in StarbucksDatabase.cartProducts {
            // Add the main price of the product
            totalAmount += product.price
            
            // Add the price of the selected size if available
            if let selectedSize = product.selectedSize {
                totalAmount += selectedSize.price
            }
        }
        
        // Round the totalAmount to two decimal places
        let roundedTotal = String(format: "%.2f", totalAmount)
        amountContainer.priceLabel.text = "R\(roundedTotal)"
    }


    
}
