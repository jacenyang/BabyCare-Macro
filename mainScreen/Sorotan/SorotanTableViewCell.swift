//
//  SorotanTableViewCell.swift
//  BabyCare-MC3
//
//  Created by Zulfa Aliyah on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class SorotanTableViewCell: UITableViewCell {

    @IBOutlet weak var namaLabel: UILabel!
    @IBOutlet weak var angkaLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.clipsToBounds = false
        cardView.layer.cornerRadius = 11
        cardView.backgroundColor = UIColor.white
        
        self.layer.cornerRadius = 11
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
