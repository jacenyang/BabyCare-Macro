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
    
    let nama = ["suhu"]
    let angka = ["32 C"]
    let status = ["demam bgt nih"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "SorotanTableViewCell", bundle: nil)
        sorotanTableView.register(nib, forCellReuseIdentifier: "cell")
        sorotanTableView.delegate = self
        sorotanTableView.dataSource = self
        
        self.sorotanTableView.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        self.sorotanTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nama.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sorotanCell = Bundle(for: SorotanTableViewCell.self).loadNibNamed("SorotanTableViewCell", owner: self, options: nil)?.first as! SorotanTableViewCell
        sorotanCell.namaLabel.text = nama[indexPath.row]
        sorotanCell.angkaLabel.text = angka[indexPath.row]
        sorotanCell.statusLabel.text = status[indexPath.row]
        return sorotanCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108.0
    }


}

