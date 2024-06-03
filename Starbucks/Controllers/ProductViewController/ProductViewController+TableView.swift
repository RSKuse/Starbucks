//
//  ItemViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

extension ProductViewController {

    // Set header height for section 1 (Size section)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 && product.size != nil ? 60.0 : 0
    }
    
    // Configure the header view for section 1 (Size section)
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1, let _ = product.size else { return nil }
        
        let headerView = TableSectionHeaderView()
        headerView.title = "Size"
        headerView.seeAllButton.isHidden = true
        headerView.requiredView.isHidden = false
        headerView.lineView.isHidden = false
        return headerView
    }

    // Define the number of sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // Define the number of rows for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return product.size?.count ?? 0
        default: return 1
        }
    }

    // Configure cells for each section and row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailsTableViewCell.cellID, for: indexPath) as! ProductDetailsTableViewCell
            cell.productNameLabel.text = product.name
            cell.productPriceLabel.text = String(format: "R%.2f", product.price)
            cell.productDescription.text = product.description
            cell.mostlikedView.isHidden = product.numberOfLikes <= 0
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductSizeTableCell.cellID, for: indexPath) as! ProductSizeTableCell
            if let size = product.size?[indexPath.row] {
                cell.sizeNameLabel.text = size.name
                cell.priceSizeLabel.text = String(format: "+R%.2f", size.price)
            }
            return cell
            
        default:
            return tableView.dequeueReusableCell(withIdentifier: ProductDisclaimerTableCell.cellID, for: indexPath) as! ProductDisclaimerTableCell
        }
    }

    // Handle row selection for size section
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        
        selectedSize = product.size?[indexPath.row]
        let newPrice = product.price + (selectedSize?.price ?? 0)
        addToBasketButton.setTitle(String(format: "Add to basket R%.2f", newPrice), for: .normal)
        
        // Update the checkmark for the selected row and deselect other rows
        for visibleIndexPath in tableView.indexPathsForVisibleRows ?? [] {
            guard let cell = tableView.cellForRow(at: visibleIndexPath) as? ProductSizeTableCell else { continue }
            let imageName = visibleIndexPath == indexPath ? StarbucksImages.selectedCheckmarkImage : StarbucksImages.unSelectedCheckmarkImage
            cell.checkMarkButton.setImage(imageName, for: .normal)
        }
    }

    // Set row heights for each section
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 161
        case 1: return 72
        default: return 56
        }
    }
    
    // Set footer height for sections
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    // Configure footer view for sections
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

