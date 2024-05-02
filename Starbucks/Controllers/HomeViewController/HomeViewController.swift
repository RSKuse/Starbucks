//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "homeLogo.")
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var advertView: AdvertContainerView = {
        let view = AdvertContainerView()
        //view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var starbucksTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        //view.backgroundColor = .white
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        registerCell()
        
        
        func setupUI() {
            view.addSubview(advertView)
            view.addSubview(starbucksTableView)
            
    
            advertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14).isActive = true
            advertView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            advertView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            advertView.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
            
            starbucksTableView.topAnchor.constraint(equalTo: advertView.bottomAnchor, constant: 10).isActive = true
            starbucksTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            starbucksTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            starbucksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
        }
        
        
        func setupNavigationBar() {
            navigationItem.titleView = logoImageView
            
            logoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            logoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
        }
        func registerCell() {
            starbucksTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCellID")
            starbucksTableView.register(FeaturedProductsTableViewCell.self, forCellReuseIdentifier: "FeaturedProductsTableViewCellID")
            
        }
        
        
    }
    
}
