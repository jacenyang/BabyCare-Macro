//
//  mainScreen.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class mainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sorotanTableView: UITableView!
    @IBOutlet weak var tipsTableView: UITableView!
    
    
    let nama = ["suhu"]
    let angka = ["32 C"]
    let status = ["demam bgt nih"]
    let judul = ["tips hadapi demam"]
    var picts:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "SorotanTableViewCell", bundle: nil)
        sorotanTableView.register(nib, forCellReuseIdentifier: "sorotanCell")
        sorotanTableView.delegate = self
        sorotanTableView.dataSource = self
        
        self.sorotanTableView.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        self.sorotanTableView.separatorStyle = .none
        
        let nib2 = UINib(nibName: "TipsTableViewCell", bundle: nil)
        tipsTableView.register(nib, forCellReuseIdentifier: "tipsCell")
        tipsTableView.delegate = self
        tipsTableView.dataSource = self
        
        self.tipsTableView.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        self.tipsTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sorotanTableView{
            return nama.count
        } else {
            return judul.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == sorotanTableView{
            let sorotanCell = Bundle(for: SorotanTableViewCell.self).loadNibNamed("SorotanTableViewCell", owner: self, options: nil)?.first as! SorotanTableViewCell
            sorotanCell.namaLabel.text = nama[indexPath.row]
            sorotanCell.angkaLabel.text = angka[indexPath.row]
            sorotanCell.statusLabel.text = status[indexPath.row]
            return sorotanCell
        } else {
            let tipsCell = Bundle(for: TipsTableViewCell.self).loadNibNamed("TipsTableViewCell", owner: self, options: nil)?.first as! TipsTableViewCell
            tipsCell.judulLabel.text = nama[indexPath.row]
            tipsCell.judulImage.image = UIImage(named: picts[indexPath.row]+".jpg")
            return tipsCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == sorotanTableView {
            return 74.0
        } else {
            return 108.0
        }
    }


}

