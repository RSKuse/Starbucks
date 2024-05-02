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
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return productsArray.count
        } else {
            return productsArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let featuredProductCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedProductsTableViewCellID", for: indexPath) as! FeaturedProductsTableViewCell
                return featuredProductCell
            } else {
                let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCellID", for: indexPath) as! ProductTableViewCell
                let product = productsArray[indexPath.row]
                productCell.productImageView.image = product.image
                productCell.productNameLabel.text = product.name
                productCell.priceLabel.text = "R\(product.price)"
                productCell.menuDescriptionLabel.text = product.description
                return productCell
            }
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableSectionHeaderView()
        
        // Comment: Adds the tappability of the seeAllButton
        headerView.seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        
        if section == 0 {
            headerView.titleLabel.text = "Featured"
        } else if section == 1 {
            headerView.titleLabel.text = "Picked For You"
        } else {
            headerView.titleLabel.text = "Bakery"
        }
        
        return headerView
    }
    
    @objc func seeAllButtonTapped() {
        let productsViewController = ProductsViewController()
        productsViewController.hidesBottomBarWhenPushed = true // Comment: Hides the tab bar when navigating
        navigationController?.pushViewController(productsViewController, animated: true)
    }
    
}
