//
//  ProductOfferCollectionViewCell.swift
//  Senior Project App
//
//  Created by Abdelrazek Tarek on 2/16/15.
//  Copyright (c) 2015 Abdelrazek Tarek. All rights reserved.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var DishImage: UIImageView!
    @IBOutlet weak var DishName: UILabel!
    @IBOutlet weak var DishPrice: UILabel!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
}
