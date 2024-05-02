//
//  FeaturedProductsTableViewCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/01.
//

import Foundation
import UIKit

class FeaturedProductsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var featuredProductCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumLineSpacing = 10.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
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
//        featuredProductCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
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
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 210.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductCollectionCellID", for: indexPath) as! FeaturedProductCollectionCell
        return productCollectionCell
    }

}
