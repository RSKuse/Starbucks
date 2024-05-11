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
            if sizeOptions.isEmpty == true {
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
            if sizeOptions.count == 0 {
                return nil
            }
            
            let headerView = TableSectionHeaderView()
            headerView.title = "Size"
            headerView.seeAllButton.isHidden = true
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
            return sizeOptions.count
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
        //return section == 1 ? sizeOptions.count : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: ProductDetailsTableViewCell.cellID, for: indexPath) as! ProductDetailsTableViewCell
        case 1:
            let sizeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ProductSizeTableCell.cellID, for: indexPath) as! ProductSizeTableCell
            return sizeTableViewCell
        default:
            return tableView.dequeueReusableCell(withIdentifier: ProductDisclaimerTableCell.cellID, for: indexPath) as! ProductDisclaimerTableCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 161
        case 1:
            return 150
        default:
            return 56
        }
    }
    
}
