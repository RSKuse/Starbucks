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
        switch indexPath.section {
        case 1:
            selectedSize = product.size?[indexPath.row]
            addToBasketButton.setTitle("Add to basket R\(product.price + (selectedSize?.price ?? 0))", for: .normal)
            
            // Update the checkmark for the selected row and deselect other rows
            if let selectedCell = tableView.cellForRow(at: indexPath) as? ProductSizeTableCell {
                selectedCell.checkMarkButton.setImage(StarbucksImages.selectedCheckmarkImage, for: .normal)
            }
            
            for visibleIndexPath in tableView.indexPathsForVisibleRows ?? [] {
                if visibleIndexPath != indexPath,
                   let otherCell = tableView.cellForRow(at: visibleIndexPath) as? ProductSizeTableCell {
                    otherCell.checkMarkButton.setImage(StarbucksImages.unSelectedCheckmarkImage, for: .normal)
                }
            }
            
        default:
            break
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
