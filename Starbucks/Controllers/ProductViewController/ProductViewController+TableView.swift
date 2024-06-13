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

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard section == 1 else { return nil }
            let headerView = TableSectionHeaderView()
            headerView.title = "Size"
            headerView.seeAllButton.isHidden = true
            headerView.requiredView.isHidden = false
            headerView.lineView.isHidden = false
            return headerView
        }

        func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 1
            case 1: return product.size?.count ?? 0
            default: return 1
            }
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailsTableViewCell.cellID, for: indexPath) as! ProductDetailsTableViewCell
                //cell.productImageView.image = UIImage(named: product.imageName)
                cell.productNameLabel.text = product.name
                cell.productPriceLabel.text = StarbucksPriceDecimal.currencyFormat(price: product.price)
                cell.productDescription.text = product.description
                cell.mostlikedView.isHidden = product.numberOfLikes <= 0

                // Set nutritional information
                if let nutrition = product.nutrition {
                    cell.caloriesLabel.text = "Calories: \(nutrition.calories)"
                    cell.fatLabel.text = "Fat: \(nutrition.fat)g"
                    cell.carbsLabel.text = "Carbs: \(nutrition.carbs)g"
                    cell.proteinLabel.text = "Protein: \(nutrition.protein)g"
                }

                // Set caffeine information
                if let caffeine = product.caffeine {
                    cell.caffeineLabel.text = "Caffeine: \(caffeine)"
                } else {
                    cell.caffeineLabel.isHidden = true
                }

                // Set allergens information
                if let allergens = product.allergens, !allergens.isEmpty {
                    cell.allergensLabel.text = "Allergens: \(allergens.joined(separator: ", "))"
                } else {
                    cell.allergensLabel.isHidden = true
                }

                return cell

            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProductSizeTableCell.cellID, for: indexPath) as! ProductSizeTableCell
                if let size = product.size?[indexPath.row] {
                    cell.sizeNameLabel.text = size.name
                    cell.priceSizeLabel.text = "+" + StarbucksPriceDecimal.currencyFormat(price: size.price)
                }
                return cell

            default:
                return tableView.dequeueReusableCell(withIdentifier: ProductDisclaimerTableCell.cellID, for: indexPath) as! ProductDisclaimerTableCell
            }
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard indexPath.section == 1 else { return }

            if selectedIndexPath == indexPath {
                guard let cell = tableView.cellForRow(at: indexPath) as? ProductSizeTableCell else { return }
                cell.checkMarkButton.setImage(StarbucksImages.unSelectedCheckmarkImage, for: .normal)
                selectedIndexPath = nil
                selectedSize = nil
                addToBasketButton.setTitle(StarbucksPriceDecimal.currencyFormat(price: product.price), for: .normal)
                return
            }

            if selectedIndexPath != nil {
                guard let cell = tableView.cellForRow(at: selectedIndexPath!) as? ProductSizeTableCell else { return }
                cell.checkMarkButton.setImage(StarbucksImages.unSelectedCheckmarkImage, for: .normal)
            }

            guard let cell = tableView.cellForRow(at: indexPath) as? ProductSizeTableCell else { return }
            selectedIndexPath = indexPath
            selectedSize = product.size?[indexPath.row]
            let newPrice = product.price + (selectedSize?.price ?? 0)
            addToBasketButton.setTitle(StarbucksPriceDecimal.currencyFormat(price: newPrice), for: .normal)
            cell.checkMarkButton.setImage(StarbucksImages.selectedCheckmarkImage, for: .normal)
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.section {
            case 0: return UITableView.automaticDimension
            case 1: return 72
            default: return 56
            }
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 0
        }
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return nil
        }
    }
