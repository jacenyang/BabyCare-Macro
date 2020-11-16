//
//  ListTipsVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 16/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class ListTipsVC: ViewController {
    
    @IBOutlet weak var demamView: UIView!
    @IBOutlet weak var bradycardiaView: UIView!
    @IBOutlet weak var tips1View: UIView!
    @IBOutlet weak var tips2View: UIView!
    @IBOutlet weak var tips3View: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        demamView.layer.cornerRadius = 15
        demamView.layer.shadowColor = UIColor.black.cgColor
        demamView.layer.shadowOffset = CGSize(width: 0, height: 0)
        demamView.layer.shadowOpacity = 0.3
        demamView.layer.shadowRadius = 4.0
        
        bradycardiaView.layer.cornerRadius = 15
        bradycardiaView.layer.shadowColor = UIColor.black.cgColor
        bradycardiaView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bradycardiaView.layer.shadowOpacity = 0.3
        bradycardiaView.layer.shadowRadius = 4.0
        
        tips1View.layer.cornerRadius = 15
        tips1View.layer.shadowColor = UIColor.black.cgColor
        tips1View.layer.shadowOffset = CGSize(width: 0, height: 0)
        tips1View.layer.shadowOpacity = 0.3
        tips1View.layer.shadowRadius = 4.0
        
        tips2View.layer.cornerRadius = 15
        tips2View.layer.shadowColor = UIColor.black.cgColor
        tips2View.layer.shadowOffset = CGSize(width: 0, height: 0)
        tips2View.layer.shadowOpacity = 0.3
        tips2View.layer.shadowRadius = 4.0
        
        tips3View.layer.cornerRadius = 15
        tips3View.layer.shadowColor = UIColor.black.cgColor
        tips3View.layer.shadowOffset = CGSize(width: 0, height: 0)
        tips3View.layer.shadowOpacity = 0.3
        tips3View.layer.shadowRadius = 4.0
    }
}
