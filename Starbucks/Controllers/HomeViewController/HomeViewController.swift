//
//  HomeViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    let starBucksDatabase = StarbucksDatabase()    
    let advertHeaderView = AdvertContainerView()
    
    var categories: [StarbucksCategoryModel] = []
    
    // This is a dictionary
//    var countryCapitalCity = ["South Africa": ["Jhb", "PTA", "DBN"],
//                              "England" : ["London", "Manche", "Liverpool"], 
//                              "Zimbabwe": ["Harare", "Bulawayo"]]
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = StarbucksImages.homeImage
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var starbucksTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        //view.backgroundColor = .white
        super.viewDidLoad()
        let category = extractDatabaseFromJson()
        
        if let category = category {
            categories = category.categories
        }
        setupUI()
        setupNavigationBar()
        registerCell()
        configureHeaderView()
        
//        print(countryCapitalCity["SouthAfrica"])
//        print(countryCapitalCity["England"])
        
    }
    
    func extractDatabaseFromJson() -> Categories? {
        return ConvertJsonToModel.convert(fromFileName: "StarbucksCategories")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let cartTabBarItem = tabBarController?.tabBar.items?[1] {
            if StarbucksDatabase.cartProducts.isEmpty {
                cartTabBarItem.badgeValue = nil
            } else {
                cartTabBarItem.badgeValue = "\(StarbucksDatabase.cartProducts.count)"
            }
        }
    }
    
    func setupUI() {
        view.addSubview(starbucksTableView)
        
        starbucksTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        starbucksTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        starbucksTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        starbucksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    func setupNavigationBar() {
        navigationItem.titleView = logoImageView
        
        logoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func registerCell() {
        starbucksTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellID)
        starbucksTableView.register(FeaturedProductsTableViewCell.self, forCellReuseIdentifier: FeaturedProductsTableViewCell.cellID)
    
    }
    
    func showProduct(product: Product) {
        let productViewController = ProductViewController(product: product)
        productViewController.hidesBottomBarWhenPushed = true
        productViewController.number = { valueSelected in
            print(valueSelected)
        }
        navigationController?.pushViewController(productViewController, animated: true)
    }

}

// Comment: Adding a HeaderView (not a TableSectionHeaderView) to a TableView
extension HomeViewController {
    func sizeHeaderToFit() {
        advertHeaderView.setNeedsLayout()
        advertHeaderView.layoutIfNeeded()
        advertHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 180)
    }

    func configureHeaderView() {
        advertHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 180)
        starbucksTableView.tableHeaderView = advertHeaderView
    }
}
