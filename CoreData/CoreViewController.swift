//
//  CoreViewController.swift
//  BabyCare-MC3
//
//  Created by Rian Anjasmara on 14/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit
import CoreData

class CoreViewController: UIViewController {

    @IBOutlet weak var lblDate: UILabel!
    var models = [tanggal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

struct tanggal {
    let yesterday: Date
}
