//
//  CollectionViewCell.swift
//  TFTzin
//
//  Created by Erich Diniz on 28/11/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var champName: UILabel!

    @IBOutlet weak var champCost: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
