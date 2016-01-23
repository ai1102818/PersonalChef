//
//  MenuTableViewCell.swift
//  Rate My Professor
//
//  Created by Abdelrazek Tarek on 1/12/16.
//  Copyright © 2016 Abdelrazek Tarek. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
