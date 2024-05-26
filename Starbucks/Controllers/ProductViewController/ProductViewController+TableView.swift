//
//  ItemViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

extension ProductViewController {
    
    // HeaderView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 {
            guard let _ = product.size else {
                return 0
            }
            return 60.0
        } else {
            return 0
        }
        
        // return section == 1 ? 64 : 0  
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            guard let _ = product.size else {
                return nil
            }
            let headerView = TableSectionHeaderView()
            headerView.title = "Size"
            headerView.seeAllButton.isHidden = true
            headerView.requiredView.isHidden = false
            headerView.lineView.isHidden = false
            return headerView
        } else {
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            guard let size = product.size else {
                return 0
            }
            return size.count

        } else {
            return 1
        }
        
        /*
         if section == 1 {
         return 3
         } else {
         return 1
         }
         */
        
        // Comment: return 3 if section is equal to 1 else return 1
        // return section == 1 ? sizeOptions.count : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let productViewCell = tableView.dequeueReusableCell(withIdentifier: ProductDetailsTableViewCell.cellID, for: indexPath) as! ProductDetailsTableViewCell
            productViewCell.productNameLabel.text = product.name
            productViewCell.productPriceLabel.text = " R\(product.price)" // comment: Practice on Playground
            productViewCell.productDescription.text = product.description
            
            if product.numberOfLikes > 0 {
                productViewCell.mostlikedView.isHidden = false
            } else {
                productViewCell.mostlikedView.isHidden = true
            }
            
            return productViewCell
        case 1:
            let sizeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ProductSizeTableCell.cellID, for: indexPath) as! ProductSizeTableCell
            let size = product.size?[indexPath.row]
            sizeTableViewCell.sizeNameLabel.text = size?.name
//          sizeTableViewCell.sizeNameLabel.text = product.size?[indexPath.row].name
            
            // comment practice more (to optional unwrap)
            if let price = size?.price {
                sizeTableViewCell.priceSizeLabel.text = " R\(String(describing: price))"
            }
            
            return sizeTableViewCell
        default:
            return tableView.dequeueReusableCell(withIdentifier: ProductDisclaimerTableCell.cellID, for: indexPath) as! ProductDisclaimerTableCell
        }
          
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let size = product.size?[indexPath.row]
            
            guard let price = size?.price else {
                return
            }
            addToBasketButton.setTitle("Add to basket R\(product.price + price)", for: UIControl.State.normal)
            
            
//        addToBasketButton.setTitle("Add to basket • R\(produc)", for: .normal)
            
            // comment practice more (to optional unwrap)
//            if let price = size?.price {
//                addToBasketButton.setTitle("Add to basket R\(product.price + price)", for: .normal)
//                print(product.price + price)
//            }
//            print(size?.price)
             
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 161
        case 1:
            return 72
        default:
            return 56
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}
