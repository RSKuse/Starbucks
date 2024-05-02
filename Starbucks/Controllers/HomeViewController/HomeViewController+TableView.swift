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
            return 3
        } else {
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let featuredProductCell = tableView.dequeueReusableCell(withIdentifier: "FeaturedProductsTableViewCellID", for: indexPath) as! FeaturedProductsTableViewCell
            return featuredProductCell
            
        } else {
            let menuCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCellID", for: indexPath) as! ProductTableViewCell
            return menuCell
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableSectionHeaderView()
        tableView.separatorStyle = .none
        if section == 0 {
            headerView.titleLabel.text = "Featured"
        } else if section == 1 {
            headerView.titleLabel.text = "Picked For You"
        } else {
            headerView.titleLabel.text = "Bakery"
        }
        return headerView
    }


    
}
