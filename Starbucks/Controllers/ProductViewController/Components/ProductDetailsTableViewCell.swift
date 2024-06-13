//
//  ItemInfoCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ProductDetailsTableViewCell: UITableViewCell {
    
    static var cellID = "ProductDetailsTableViewCellID"

    lazy var mostlikedView: ProductTagContainerView = {
        let view = ProductTagContainerView()
        view.tagLabel.text = "#1 Most Liked"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var numberOflikedView: ProductTagContainerView = {
        let view = ProductTagContainerView()
        view.tagLabel.text = "♥︎90% (1k)"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productDescription: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.0
        label.textColor = StarbucksColors.starbucksTextGray
        let attributedString = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.attributedText = attributedString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Nutritional Information
    lazy var nutritionLabel: UILabel = {
        let label = UILabel()
        label.text = "Nutrition"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var caloriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Calories: 0"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fatLabel: UILabel = {
        let label = UILabel()
        label.text = "Fat: 0g"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var carbsLabel: UILabel = {
        let label = UILabel()
        label.text = "Carbs: 0g"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var proteinLabel: UILabel = {
        let label = UILabel()
        label.text = "Protein: 0g"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var caffeineLabel: UILabel = {
        let label = UILabel()
        label.text = "Caffeine: 0mg"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var allergensLabel: UILabel = {
        let label = UILabel()
        label.text = "Allergens: None"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nutritionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            productNameLabel,
            productPriceLabel,
            productDescription,
            nutritionLabel,
            caloriesLabel,
            fatLabel,
            carbsLabel,
            proteinLabel,
            caffeineLabel,
            allergensLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {

        addSubview(mostlikedView)
        addSubview(numberOflikedView)
        addSubview(nutritionStackView)

      
        mostlikedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mostlikedView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        mostlikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true

        numberOflikedView.leadingAnchor.constraint(equalTo: mostlikedView.trailingAnchor, constant: 8).isActive = true
        numberOflikedView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        numberOflikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true

        nutritionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nutritionStackView.topAnchor.constraint(equalTo: mostlikedView.bottomAnchor, constant: 10).isActive = true
        nutritionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        nutritionStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
