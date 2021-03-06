//
//  tips1.swift
//  BabyCare-MC3
//
//  Created by Zulfa Aliyah on 14/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class TipsBradycardia: UIViewController {
    
    @IBOutlet weak var scrl: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pengertianLabel: UILabel!
    @IBOutlet weak var penyebabLabel: UILabel!
    @IBOutlet weak var pertolonganLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrl.contentLayoutGuide.bottomAnchor.constraint(equalTo: pertolonganLabel.bottomAnchor).isActive = true
        
        showTips()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnTutupTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showTips(){
        titleLabel.text = "Bradycardia"
        
        pengertianLabel.text = "Bradycardia merupakan kondisi dimana bayi menunjukkan gejala denyut nadi rendah (<80 bpm) dan disertai nafas lambat."
        
        penyebabLabel.text = """
        1. Kekurangan oksigen
        2. Temperatur badan bayi rendah
        3. Efek atau pengaruh obat
        4. Penyakit jantung bawaan
        """
        
        pertolonganLabel.text = """
        Pastikan bahwa tidak ada kemungkinan jalan nafas bayi terhambat, seperti posisi dada yang tertekan, jalur nafas yang tertutup atau mungkin kondisi ruangan/ambient yang tidak nyaman, misalnya terlalu panas dan lembab. Segera bawa bayi ke dokter dan beri penanganan intensif!
        """
    }
    
    
}
