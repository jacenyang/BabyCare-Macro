//
//  TableViewCell.swift
//  BabyCare-MC3
//
//  Created by Zulfa Aliyah on 14/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var judul: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cardview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardview.clipsToBounds = false
        cardview.layer.cornerRadius = 11
        cardview.backgroundColor = UIColor.white
        
        self.layer.cornerRadius = 11
    }



}
