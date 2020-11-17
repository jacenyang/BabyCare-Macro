//
//  TipsBasah.swift
//  BabyCare-MC3
//
//  Created by Jason Yang on 17/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class TipsLembab: UIViewController {

    @IBOutlet weak var tipsScrollView: UIScrollView!
    
    @IBOutlet weak var judul1: UILabel!
    @IBOutlet weak var judul2: UILabel!
    @IBOutlet weak var judul3: UILabel!
    
    @IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var desc2: UILabel!
    @IBOutlet weak var desc3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipsScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: desc3.bottomAnchor).isActive = true
        
        showTips()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTutupTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showTips(){
        judul1.text = "Kering"
        
        desc1.text = "Inkubator di katakan lembab Jika persentase kelembaban di atas 60%"
        
        judul2.text = "Pencegahan"
        
        desc2.text = """
        1. Letak kan inkubator ke tempat datar
        2. Coloklah kabel” inkubator ke stop kontak
        3. Buka lah Aplikasi Inkubator
        4. Pastikan Humidity / Kelembaban Sekitar 40% - 60%
        5. Jika Humidity / Kelembaban di antara 40% - 60% di situlah temnpat yang tepat untuk meletakkan inkubator
        6. Tetapi Jika lebih dari 60% /kurang dari 40% silakan di pindahkan Inkubatornya ke tempat lain dan lakukan lagi dari step-1 sampai 5
        """
        
        judul3.text = "Penyebab"
        
        desc3.text = """
        1. Ruangan pengap
        2. Ruangan tidak pernah kena sinar matahari
        3. Ruangan basah / berair
        """
    }
    
}
