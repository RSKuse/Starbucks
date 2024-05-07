//
//  AdvertContainerView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class AdvertContainerView: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var imagePostCellHeight = CGFloat(140)
    var postImagesArray: [UIImage] = [UIImage(named: "espressoFrappuccino")!]
    
    lazy var advertImageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumLineSpacing = 0.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        registerCollectionCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI () {
        addSubview(advertImageCollectionView)
//        addSubview(advertImageView)
        
//        
//        advertImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
//        advertImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
//        advertImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        advertImageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        
        advertImageCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        advertImageCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        advertImageCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        advertImageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func registerCollectionCells() {
        advertImageCollectionView.register(AdvertCell.self, forCellWithReuseIdentifier: "AdvertCellID")

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: imagePostCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let advertCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertCellID", for: indexPath) as! AdvertCell
        return advertCollectionCell
        
    }
    
    
    
}

