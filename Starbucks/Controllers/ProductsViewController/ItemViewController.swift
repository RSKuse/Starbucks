//
//  ItemViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    
    
    lazy var productTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    lazy var payCheckoutButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to basket • R48.00", for: .normal)
        button.layer.cornerRadius = 8.0
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = StarbucksColors.primaryColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Latte"
        setupUI()
        registerCell()
      
    }
    
    func setupUI() {
        view.addSubview(productTableView)
        view.addSubview(payCheckoutButton)
        
        
        productTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        productTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        payCheckoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        payCheckoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        payCheckoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        payCheckoutButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
    }
    
    func registerCell() {
        productTableView.register(ItemInfoCell.self, forCellReuseIdentifier: "ItemInfoCellID")
        
            
        
    }

}



