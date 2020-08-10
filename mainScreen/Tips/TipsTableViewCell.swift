//
//  TipsTableViewCell.swift
//  BabyCare-MC3
//
//  Created by Zulfa Aliyah on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class TipsTableViewCell: UITableViewCell {
    @IBOutlet weak var judulLabel: UILabel!
    @IBOutlet weak var judulImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
