//
//  CategoryTableViewCell.swift
//  Senior Project App
//
//  Created by Abdelrazek Tarek on 2/16/15.
//  Copyright (c) 2015 Abdelrazek Tarek. All rights reserved.
//

import UIKit

class SellerTableViewCell: UITableViewCell {

    @IBOutlet weak var SellerName: UILabel!
    @IBOutlet weak var DishessCollectionView: UICollectionView!
    @IBOutlet weak var SeeAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, index: NSInteger) {
        self.DishessCollectionView.dataSource = delegate
        self.DishessCollectionView.delegate = delegate
        self.DishessCollectionView.tag = index
        self.DishessCollectionView.reloadData()
    }
}
