//
//  ProductsViewController.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/05/02.
//

import Foundation
import UIKit

class ProductsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let spacing: CGFloat = 1
    
    lazy var productCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical // Change to vertical scrolling
        flowLayout.minimumLineSpacing = spacing // Spacing between rows
        flowLayout.minimumInteritemSpacing = spacing // Spacing between items in the same row
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupConstraints()
        registerCollectionCells()
    }
    
    func setupConstraints() {
        view.addSubview(productCollectionView)
        
        productCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        productCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        productCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        productCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func registerCollectionCells() {
        productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCellID")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCellID", for: indexPath) as! ProductCollectionViewCell
        
        return productCollectionCell
   
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenItems: CGFloat = 10
        let totalSpacing = (2 * spacingBetweenItems) + ((numberOfItemsPerRow - 1) * spacingBetweenItems)
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: 171, height: 230) // Assuming square cells
    }

    

    
    
    
    
    
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    var category: String // Add this property to hold the selected category
//    var featuredProductsArray: [Product] = []
//    
//    init(category: String) {
//        self.category = category
//        super.init(nibName: nil, bundle: nil)
//    }
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    // Add necessary properties
//    
//    //var products: [Product] = [] // Assuming you have an array of products
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = category // Set the title to the selected category
//        // Configure collection view and fetch products
//        setupCollectionView()
//        fetchProducts()
//    }
//    
//    func setupCollectionView() {
//        // Initialize and configure collection view
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 10 // Set spacing between columns
//        layout.minimumLineSpacing = 10 // Set spacing between rows
//        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCellID")
//        collectionView.backgroundColor = .white // Set collection view background color
//        // Add collectionView to the view hierarchy
//        view.addSubview(collectionView)
//        
//        // Add constraints to collectionView if needed
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//    
//    func fetchProducts() {
//        // Fetch products based on the selected category
//        // Use the category property to determine which products to fetch
//        // Here, I'm assuming you have a method to fetch products and assign them to the `products` array
//        // Example: products = ProductService.fetchProducts(forCategory: category)
//        featuredProductsArray = ProductService.fetchProducts(forCategory: category)
//    }
//    
//    // MARK: UICollectionViewDataSource methods
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return featuredProductsArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCellID", for: indexPath) as! ProductCollectionViewCell
//        let product = featuredProductsArray[indexPath.item]
//        // Configure the cell with product information
//        cell.configure(with: product)
//        return cell
//    }
//    
//    // MARK: UICollectionViewDelegateFlowLayout methods
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfItemsPerRow: CGFloat = 2
//        let spacingBetweenItems: CGFloat = 10
//        let totalSpacing = (2 * spacingBetweenItems) + ((numberOfItemsPerRow - 1) * spacingBetweenItems)
//        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
//        return CGSize(width: width, height: width) // Assuming square cells
//    }
//}








//class ProductsViewController: UIViewController {
//
//    var featuredProductsArray: [Product] = []
//    var category: String // Add this property to hold the selected category
//
//    init(category: String) {
//        self.category = category
//        super.init(nibName: nil, bundle: nil)
//    }
//
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = category // Set the title to the selected category
//    }
//}
