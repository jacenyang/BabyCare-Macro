//
//  TipsSuhuKabinVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 17/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class TipsSuhuKabinVC: UIViewController {
    
    @IBOutlet weak var deskripLabel: UILabel!
    @IBOutlet weak var deskripLabel2: UILabel!
    @IBOutlet weak var deskripLabel3: UILabel!
    
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var step3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func suhuKabin() {
        
        deskripLabel.text = "Suhu inkubator bayi dijaga dalam batas normal sekitar 33°C sampai 35°C."
        step1Label.text = "1. Jika suhu kabin terdetek di atas 35C \n2. Penghangat akan mati dengan sendirinya \n3. Tunggu sampai suhu sudah normal \n4. Penghangat akan menyala dengan sendirinya \n5. Tetapi jika penghangat sudah di matikan \n6. Dan dalam waktu 10-20 menit suhu tetap panas \n7. Pindahkan lah inkubator ke tempat yang lebih normal \n8.  Yaitu 33 - 35 derajat Selsius \n9. Jangan mengarahkan AC / kipas ke bayi!!!"
        
        deskripLabel2.text = "Suhu inkubator bayi dijaga dalam batas normal sekitar 33°C sampai 35°C."
        step2Label.text = "1. Jika suhu kabin terdetek di bawah 35C \n2. Penghangat akan tetap menyala \n3. Penghangat hanya akan mati Jika di atas 35C \n4. Tetapi jika penghangat sudah nyala \n5. Dan dalam waktu 10-20 menit suhu tetap dingin \n6. Tambahkan penghangat / bolham ke bawah tempat tidur di dalam inkubator / bisa juga melakukan metode peluk / kangaroo mom"
        
        deskripLabel3.text = "Apabila berat pada bayi prematur di bawah 1,5 KG, angka kematian bisa mencapai 25 hingga 50%."
        step3Label.text = "Kebanyakan bayi prematur membutuhkan 8 sampai 10 kali menyusui dalam sehari. \nUntuk bayi prematur yang lahir di usia kehamilan 33 minggu atau lebih, kenaikan berat badan yang diharapkan adalah 20-30 gram per hari \nSedangkan untuk bayi prematur yang lahir di usia kehamilan 24-33 minggu, kenaikan berat badan yang diharapkan adalah 5 gram per hari. \nSecara umum, berat badan bayi prematur diharapkan naik rata-rata 15 gram per hari untuk setiap 1 kg berat badannya."
    }
    
    @IBAction func btnTutupTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
