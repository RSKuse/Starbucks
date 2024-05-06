//
//  HomeViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/30.
//

import Foundation
import UIKit

extension HomeViewController {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 219
        } else {
            return 116
        }
            
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return starBucksDatabase.categoriesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        switch starBucksDatabase.categoriesArray[section] {
        case "Featured":
            return 1
            case ""
        }
        */
        
        if starBucksDatabase.categoriesArray[section] == "Featured" {
            return 1
        } else if starBucksDatabase.categoriesArray[section] == "Picked For You" {
            return starBucksDatabase.pickedForYouArray.count
        } else {
            return starBucksDatabase.bakeryArray.count
        }
        /*
        switch section {
        case 0:
            return 1
        case 1:
            return starBucksDatabase.pickedForYouArray.count
        default:
            return starBucksDatabase.bakeryArray.count
        }
        */
        
        /*
        if section == 0 {
            return 1
        } else if section == 1 {
            return starBucksDatabase.pickedForYouArray.count
        } else {
            return starBucksDatabase.bakeryArray.count
        }
        */
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Comment: Practice Switch Statements
        switch indexPath.section {
        case 0:
            let featuredProductCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedProductsTableViewCellID", for: indexPath) as! FeaturedProductsTableViewCell
            featuredProductCell.featuredProductsArray = starBucksDatabase.sortedFeaturedProducts()
            return featuredProductCell
        case 1:
            let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCellID", for: indexPath) as! ProductTableViewCell
            let product = starBucksDatabase.pickedForYouArray[indexPath.row]
            productCell.productImageView.image = product.image
            productCell.productNameLabel.text = product.name
            productCell.priceLabel.text = "R\(product.price)"
            productCell.menuDescriptionLabel.text = product.description
            return productCell
        default:
            let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCellID", for: indexPath) as! ProductTableViewCell
            let product = starBucksDatabase.bakeryArray[indexPath.row]
            productCell.productImageView.image = product.image
            productCell.productNameLabel.text = product.name
            productCell.priceLabel.text = "R\(product.price)"
            productCell.menuDescriptionLabel.text = product.description
            return productCell
        }
        
        /*
        if indexPath.section == 0 {
            
        } else {
            
        }
        */
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableSectionHeaderView()
        
        // Comment: Adds the tappability of the seeAllButton
        headerView.seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        headerView.title = starBucksDatabase.categoriesArray[section]
        
        /*
        if section == 0 {
            headerView.titleLabel.text = "Featured"
        } else if section == 1 {
            headerView.titleLabel.text = "Picked For You"
        } else {
            headerView.titleLabel.text = "Bakery"
        }
        */
        
        return headerView
    }
    
    @objc func seeAllButtonTapped(sender: UIButton) {
        guard let headerView = sender.superview as? TableSectionHeaderView else {
            return
        }
        let sectionTitle = headerView.title
        print("Section Title: \(sectionTitle)") 
        
        var productsToShow: [Product] = []
        
        switch sectionTitle {
        case "Featured":
            productsToShow = starBucksDatabase.sortedFeaturedProducts()
        case "Picked For You":
            productsToShow = starBucksDatabase.pickedForYouArray
        case "Bakery":
            productsToShow = starBucksDatabase.bakeryArray
        default:
            break
        }
    
        
        let productsViewController = ProductsViewController(products: productsToShow)
        productsViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(productsViewController, animated: true)
    }

    
}
