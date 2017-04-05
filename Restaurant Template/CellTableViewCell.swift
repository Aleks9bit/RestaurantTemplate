//
//  CellTableViewCell.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 31.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        let font = UIFont(name: FontFamily.from(type: .semiBold), size: FontSize.from(type: .normal))

        titleLabel.textColor = Color.from(type: .menuText)
        titleLabel.font = font

    }
}
