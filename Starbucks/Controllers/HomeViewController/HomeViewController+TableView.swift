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
            return categories.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return section == 0 ? 1 : categories[section].products.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let featuredProductCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedProductsTableViewCellID", for: indexPath) as! FeaturedProductsTableViewCell
                let featuredProducts = categories[indexPath.section]
                featuredProductCell.featuredProductsArray = featuredProducts.products
                featuredProductCell.didSelectProduct = { productSelected in
                    self.showProduct(product: productSelected)
                }
                return featuredProductCell
            } else {
                guard let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCellID", for: indexPath) as? ProductTableViewCell else {
                    return UITableViewCell()
                }
                let product = categories[indexPath.section].products[indexPath.row]
                productCell.productImageView.image = UIImage(named: product.imageName)
                productCell.productNameLabel.text = product.name
                productCell.priceLabel.text = StarbucksPriceDecimal.currencyFormat(price: product.price)
                productCell.menuDescriptionLabel.text = product.description
                return productCell
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            if indexPath.section != 0 {
                let categories = categories[indexPath.section]
                let product = categories.products[indexPath.row]
                showProduct(product: product)
            }
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = TableSectionHeaderView()
            headerView.seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
            headerView.seeAllButton.tag = section
            headerView.title = categories[section].name
            return headerView
        }
        
        @objc func seeAllButtonTapped(sender: UIButton) {
            let categoryTitle = categories[sender.tag].name
            let products = categories[sender.tag].products
            let productsViewController = ProductsViewController(products: products, title: categoryTitle)
            productsViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(productsViewController, animated: true)
        }
    }
