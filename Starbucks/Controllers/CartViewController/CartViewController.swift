//
//  CartViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Properties
    var cartProductArray: [CartModel] = StarbucksDatabase.cartProducts
    var cartProductarray: [CartModel] = []
    let starbucksDatabase = StarbucksDatabase()
    var sizeNameString = ""
    var priceSizeString = ""
    

    lazy var amountContainer: TotalAmountContainerView = {
        let view = TotalAmountContainerView()
        view.isHidden = true
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
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.isHidden = true
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        title = "Cart"
        setupNavigationBar()
        setupUI()
        registerCell()
        updateCartView()
        NotificationCenter.default.addObserver(self, selector: #selector(payCheckoutButtonTapped), name: NSNotification.Name("payCheckoutButtonTapped"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload the table view each time the view appears
        cartTableView.reloadData()
        updateCartView()
    }
    
    //Setup UI
    func setupUI() {
        view.addSubview(cartTableView)
        view.addSubview(emptyCartLabel)
        view.addSubview(amountContainer)
        
        emptyCartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyCartLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
        cartTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
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
    
    //Update Cart View
    func updateCartView() {
        if StarbucksDatabase.cartProducts.isEmpty {
            amountContainer.isHidden = true
            cartTableView.isHidden = true
            emptyCartLabel.isHidden = false
            amountContainer.payCheckoutButton.isEnabled = false
        } else {
            amountContainer.isHidden = false
            cartTableView.isHidden = false
            emptyCartLabel.isHidden = true
            cartTableView.reloadData()
            updateTotalAmount()
            amountContainer.payCheckoutButton.isEnabled = true
            amountContainer.payCheckoutButton.backgroundColor = StarbucksColors.primaryColor
            amountContainer.payCheckoutButton.setTitleColor(.white, for: .normal)
        }
    }
    
    //Payment Handling
    @objc func payCheckoutButtonTapped() {
        let totalAmount = amountContainer.priceLabel.text ?? "R0.00"
        let alert = UIAlertController(title: "Confirm Payment", message: "Do you want to pay \(totalAmount)?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Pay", style: .default, handler: { _ in
            self.completePayment()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func completePayment() {
        StarbucksDatabase.cartProducts.removeAll()
        updateCartView()
        amountContainer.priceLabel.text = "R0.00"
        
        let successAlert = UIAlertController(title: "Payment Successful", message: "Your payment was completed successfully.", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(successAlert, animated: true, completion: nil)
    }
    
    //Update Total Amount
    func updateTotalAmount() {
        var totalAmount = 0.0
        for product in StarbucksDatabase.cartProducts {
            totalAmount += product.cost
        }
        
        amountContainer.priceLabel.text = StarbucksPriceDecimal.currencyFormat(price: totalAmount)
    }

}

