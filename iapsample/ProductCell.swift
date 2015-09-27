//
//  ProductCell.swift
//  iapsample
//
//  Created by Naoki Fujii on 9/27/15.
//  Copyright © 2015 nfujii. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
