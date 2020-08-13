//
//  mainScreen.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class mainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tipsTable: UITableView!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    
    let judul = ["tips hadapi demam", "tips hadapi hipotermia"]
    var picts:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipsTable.delegate = self
        tipsTable.dataSource = self
        
        self.tipsTable.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        self.tipsTable.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tipsTable.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
                cell.selectionStyle = .none
                cell.judul.text = judul[indexPath.section]
    //            cell.img.image = picts[indexPath.row]
                return cell
            }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            judul.count
        }
    //
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 170
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 10
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 10
        }
        
        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            view.tintColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        }
        
        func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
            view.tintColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        }
        func tableView(_ tableView: UITableView, willDisplaycell: UITableViewCell, forRowAt indexPath: IndexPath) {
            tblHeight.constant = tipsTable.contentSize.height
        }
}

