//
//  FeaturedProductsTableViewCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/01.
//

import Foundation
import UIKit

class FeaturedProductsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static var cellID = "FeaturedProductsTableViewCellID"
    
    var featuredProductsArray: [Product] = []
    
    // Closure
    var didSelectProduct: ((Product) -> Void)?
    
    lazy var featuredProductCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumLineSpacing = 10.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        // Comment: This will push the collectionview on the left and right by 20.0
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        collectionView.backgroundColor = UIColor.clear
        
        // Comment: Hide the horizontal indicator
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        setupView()
        registerCollectionCell()
        backgroundColor = UIColor.clear
    }
        
    
    func setupView() {
        contentView.addSubview(featuredProductCollectionView)

        featuredProductCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        featuredProductCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        featuredProductCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        featuredProductCollectionView.heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    func registerCollectionCell() {
        featuredProductCollectionView.register(FeaturedProductCollectionCell.self, forCellWithReuseIdentifier: "FeaturedProductCollectionCellID")
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeaturedProductsTableViewCell {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredProductsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 210.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductCollectionCellID", for: indexPath) as! FeaturedProductCollectionCell
        let product = featuredProductsArray[indexPath.item]
        productCollectionCell.productImageView.image = UIImage(named: product.imageName)
        productCollectionCell.productNameLabel.text = product.name
        
        if product.numberOfLikes == 0 {
    
        } else {
            
            productCollectionCell.mostLikedView.isHidden = true
            if product.numberOfLikes > 1000 && product.numberOfLikes < 2000 {
                productCollectionCell.priceLabel.text = " R\(product.price) ♥︎\(product.rating) (1k)"
            } else if product.numberOfLikes > 2000 && product.numberOfLikes < 3000 {
                productCollectionCell.mostLikedView.isHidden = false
                productCollectionCell.priceLabel.text = " R\(product.price) ♥︎\(product.rating) (2k)"
            } else {
                productCollectionCell.priceLabel.text = " R\(product.price) ♥︎\(product.rating) (\(product.numberOfLikes))"
            }
        }

        return productCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = featuredProductsArray[indexPath.item]
        didSelectProduct?(product)
        // didSelectProduct = product
    }

}
