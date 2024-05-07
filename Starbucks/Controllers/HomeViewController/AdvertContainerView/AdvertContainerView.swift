//
//  AdvertContainerView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class AdvertContainerView: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let imagePostCellHeight = CGFloat(10)
    var postImagesArray: [UIImage] = []
    
    //let starbucksColors = StarbucksColors()
    
    // HomeWork: Add a CollectionView in Here
    
    lazy var advertImageCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumLineSpacing = 0.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
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
        advertImageCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        advertImageCollectionView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true

        
    }
    
    func registerCollectionCells() {
        advertImageCollectionView.register(AdvertCell.self, forCellWithReuseIdentifier: "AdvertCellID")

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: imagePostCellHeight)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let advertCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertCellID", for: indexPath) as! AdvertCell
        return advertCollectionCell
        
    }
    
    
    
}

