//
//  tips1.swift
//  BabyCare-MC3
//
//  Created by Zulfa Aliyah on 14/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class tips1: UIViewController {

    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pengertianLabel: UILabel!
    @IBOutlet weak var penyebabLabel: UILabel!
    @IBOutlet weak var pertolonganLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTips()
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
