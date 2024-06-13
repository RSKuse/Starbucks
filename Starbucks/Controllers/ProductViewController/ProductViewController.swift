//
//  ItemViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let productHeaderView = ItemContainerView()
    var product: Product
    var selectedSize: ProductSize?
    var selectedIndexPath: IndexPath?
    
    var number: ((Int) -> Void)?
    
    /**
     - Ask Gugu about this
     reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
         return s1 > s2
     })
     */
    
    /**
     Is this a closure as well and how does it work.
     func backward(_ s1: String, _ s2: String) -> Bool {
         return s1 > s2
     }
     */
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
        let buttonText = "Add to basket • " + StarbucksPriceDecimal.currencyFormat(price: product.price)
        button.setTitle(buttonText, for: .normal)
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
        let basketButtonText = "Add to basket • " + StarbucksPriceDecimal.currencyFormat(price: product.price)
        addToBasketButton.setTitle(basketButtonText, for: .normal)
        productHeaderView.product = product
        //productHeaderView.productImageView.image = UIImage(named: product.imageName)
    }
    
    func setupUI() {
            view.addSubview(productTableView)
            view.addSubview(addToBasketButton)
            
            NSLayoutConstraint.activate([
                productTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                productTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                productTableView.bottomAnchor.constraint(equalTo: addToBasketButton.topAnchor, constant: -20),
                productTableView.topAnchor.constraint(equalTo: view.topAnchor),
                
                addToBasketButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                addToBasketButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                addToBasketButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                addToBasketButton.heightAnchor.constraint(equalToConstant: 48)
            ])
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
            productTableView.tableHeaderView = productHeaderView
            productHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 318)
            productTableView.tableHeaderView = productHeaderView
            sizeHeaderToFit()
        }
        
        @objc func addToBasket() {
            let cartItem = CartModel(
                name: product.name,
                image: product.imageName,
                cost: product.price + (selectedSize?.price ?? 0),
                numberOfItems: 1,
                selectedSize: selectedSize
            )
            
            StarbucksDatabase.cartProducts.append(cartItem)
            
            let alert = UIAlertController(title: "Added to Cart", message: "\(product.name) has been added to your cart.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.navigationController?.popToRootViewController(animated: true)
                self.number?(3)
            }))
            present(alert, animated: true, completion: nil)
        }
        
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
    




