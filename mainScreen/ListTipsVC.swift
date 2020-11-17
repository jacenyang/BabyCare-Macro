//
//  ListTipsVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 16/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class ListTipsVC: ViewController {
    
    @IBOutlet weak var listTipsScrollView: UIScrollView!
    
    @IBOutlet weak var demamView: UIView!
    @IBOutlet weak var bradycardiaView: UIView!
    @IBOutlet weak var beratBadanBayiView: UIView!
    @IBOutlet weak var suhuKabinView: UIView!
    @IBOutlet weak var humidityView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTipsScrollView.contentLayoutGuide.topAnchor.constraint(equalTo: demamView.topAnchor).isActive = true
        listTipsScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: humidityView.bottomAnchor).isActive = true
        
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
        
        beratBadanBayiView.layer.cornerRadius = 15
        beratBadanBayiView.layer.shadowColor = UIColor.black.cgColor
        beratBadanBayiView.layer.shadowOffset = CGSize(width: 0, height: 0)
        beratBadanBayiView.layer.shadowOpacity = 0.3
        beratBadanBayiView.layer.shadowRadius = 4.0
        
        suhuKabinView.layer.cornerRadius = 15
        suhuKabinView.layer.shadowColor = UIColor.black.cgColor
        suhuKabinView.layer.shadowOffset = CGSize(width: 0, height: 0)
        suhuKabinView.layer.shadowOpacity = 0.3
        suhuKabinView.layer.shadowRadius = 4.0
        
        humidityView.layer.cornerRadius = 15
        humidityView.layer.shadowColor = UIColor.black.cgColor
        humidityView.layer.shadowOffset = CGSize(width: 0, height: 0)
        humidityView.layer.shadowOpacity = 0.3
        humidityView.layer.shadowRadius = 4.0
    }
}
