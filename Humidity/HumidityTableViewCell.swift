//
//  HumidityTableViewCell.swift
//  BabyCare-MC3
//
//  Created by Jason Yang on 17/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class HumidityTableViewCell: UITableViewCell {

    @IBOutlet weak var tanggalLabel: UILabel!
    @IBOutlet weak var angkaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
